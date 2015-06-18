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
    - name: '/etc/elasticsearch/elasticsearch.yml'
    - contents: |+
          network.bind_host: {{ bind_host }}
    - mode: 644

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

