{% set kibana_uri = salt['pillar.get']('kibana:pkg:uri') -%}
{% set kibana_hash = salt['pillar.get']('kibana:pkg:hash') -%}
{% set kibana_dir = salt['pillar.get']('kibana:install_dir') -%}

kibana:
  archive.extracted:
    - name: {{ kibana_dir }}
    - source: {{ kibana_uri }}
    - source_hash: {{ kibana_hash }}
    - archive_format: tar
    - tar_options: xf

kibana_service:
  file.managed:
    - source: salt://elk/templates/kibana4.initd
    - name: /etc/init.d/kibana4
    - mode: 755
    - template: jinja
    #file.managed:
      #- source: salt://elk/files/kibana4.service
      #- name: /etc/systemd/system/kibana4.service
  cmd.run:
    - name: update-rc.d kibana4 defaults
    # FIXME ^^ hack, due to systemd not working in docker containters properly ...
  service.running:
    - name: kibana4
    #- enable: True
