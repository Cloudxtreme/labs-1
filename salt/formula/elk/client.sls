rsyslog:
  pkg.installed:
    - name: rsyslog
  service.running:
    - name: rsyslog

rsyslog-to-logstash:
  file.managed:
    - source: salt://elk/templates/logstash-rsyslog-client.conf
    - name: /etc/rsyslog.d/99-logstash-rsyslog-client.conf
    - require:
      - pkg: rsyslog
    - watch_in:
      - service: rsyslog
    - template: jinja
