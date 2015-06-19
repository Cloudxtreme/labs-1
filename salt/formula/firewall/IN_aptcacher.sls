{% set port = salt['pillar.get']('apt:proxy:bind_port') -%}
iptables_in_aptcacher:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - proto: tcp
    - dport: {{ port }}
    - save: True
    - require:
      - pkg: iptables

