include:
  - java
  - apt.client

{% set bind_host = salt['pillar.get']('elastic:bind_host') %}

elasticsearch_soft:
  pkg.installed:
    - name: elasticsearch
    - version: 1.5.2
    - require:
      - file: apt-elk-repos

elastic_conf:
  file.managed:
    - source: salt://elk/templates/elasticsearch.yml
    - name: /etc/elasticsearch/elasticsearch.yml
    - mode: 644
    - template: jinja
    - watch_in:
      service: elastic_service

elastic_service:
  pkg.installed:
    - name: elasticsearch
    - require:
      - file: elastic_conf
  service.running:
    - name: elasticsearch
    - watch:
      - file: elastic_conf
    - require:
      - pkg: elasticsearch
  cmd.run:
    - name: update-rc.d elasticsearch defaults
    # FIXME ^^ hack, due to systemd not working in docker containters properly ...

