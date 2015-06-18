include:
  - java

{% set kibana_port = salt['pillar.get']('kibana:httpport', '8080') %}
{% set elastic_port = salt['pillar.get']('elasticsearch:httpport', '9200') %}
{% set server_name = salt['pillar.get']('kibana:site_name', 'kibana.cdp') %}
{% set wwwhome = salt['pillar.get']('kibana:wwwhome', '/var/www') %}
{% set kibana_wwwroot = wwwhome + '/' + server_name + '/' %}
{% set elastic_htpasswd_file = '/etc/nginx/elastic_passwd' %}
{% set bind_host = salt['pillar.get']('kibana:bind_host') %}

nginx_sites_dir:
  file.directory:
    - name: /etc/nginx/sites-enabled
    - makedirs: True

kibana_config_js:
  file.managed:
    - name: '{{ kibana_wwwroot }}/config.js'
    - template: jinja
    - source: salt://elk/templates/config.js
    - context:
       kibana_port: {{ kibana_port }}
       bind_host: {{ bind_host }}

elastic_htpasswd:
  file.managed:
    - name: {{ elastic_htpasswd_file }}
    - contents_pillar: elastic:htpasswd
    - group: www-data
    - mode: 640

nginx_static_site:
  pkg.installed:
    - name: nginx
    - require:
      - file: nginx_sites_dir
      - file: kibana_static_dir
      - file: elastic_htpasswd

  service.running:
    - name: nginx
    - reload: True
    - enable: True
    - watch:
      - file: nginx_static_site
    - require:
      - service: elasticsearch

  file.managed:
    - template: jinja
    - source: salt://elk/templates/nginx_kibana_site
    - name: /etc/nginx/sites-enabled/kibana
    - mode: 644
    - context:
       kibana_port: {{ kibana_port }}
       server_name: {{ server_name }}
       kibana_wwwroot: {{ kibana_wwwroot }}
       elastic_htpasswd_file: {{ elastic_htpasswd_file }}
