apt-elk-key:
  file.managed:
    - name: /etc/apt/elk.asc
    - source: salt://apt/files/elk.asc

apt-add-elk-key:
  cmd.wait:
    - name: apt-key add /etc/apt/elk.asc
    - watch:
      - file: apt-elk-key

apt-elk-repos:
  file.managed:
    - name: /etc/apt/sources.list.d/elk.list
    - source: salt://apt/templates/elk.list
    - template: jinja
    - watch_in:
      - cmd: apt-update

apt-update:
  cmd.wait:
    - name: apt-get update

disable-unattended-upgrades:
  pkg.purged:
    - name: unattended-upgrades
    - require:
      - cmd: apt-update

