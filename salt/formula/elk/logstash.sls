include:
  - java
  - apt.client

logstash_soft:
  pkg.installed:
    - name: logstash
    - version: 1:1.5.0-1
    - require:
      - file: apt-elk-repos

logstash_service:
  pkg.installed:
  - name: logstash
  service.running:
    - name: logstash

logstash-in-syslog:
  file.managed:
    - source: salt://elk/templates/logstash-rsyslog.conf
    - name: /etc/logstash/conf.d/logstash-rsyslog.conf
    - template: jinja
    - require:
      - pkg: logstash_soft
    - watch_in:
      - service: logstash_service
  cmd.run:
    - name: update-rc.d logstash defaults
    # FIXME ^^ hack, due to systemd not working in docker containters properly ...
