iptables-in-tcp-log:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: LOG
    - match: state
    - connstate: NEW
    - proto: tcp
    - save: True
    - require:
      - pkg: iptables

iptables-in-udp-log:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: LOG
    - proto: UDP
    - save: True
    - require:
      - pkg: iptables

iptables-in-tcp-reject-all-other:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: REJECT
    - proto: tcp
    - save: True
    - require:
      - pkg: iptables

iptables-in-udp-reject-all-other:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: REJECT
    - proto: udp
    - save: True
    - require:
      - pkg: iptables
