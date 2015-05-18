iptables-out-tcp-log:
  iptables.append:
    - table: filter
    - chain: OUTPUT
    - jump: LOG
    - match: state
    - connstate: NEW
    - proto: tcp
    - save: True
    - require:
      - pkg: iptables

iptables-out-udp-log:
  iptables.append:
    - table: filter
    - chain: OUTPUT
    - jump: LOG
    - proto: udp
    - save: True
    - require:
      - pkg: iptables

iptables-out-tcp-reject-all-other:
  iptables.append:
    - table: filter
    - chain: OUTPUT
    - jump: REJECT
    - proto: tcp
    - save: True
    - require:
      - pkg: iptables

iptables-out-udp-reject-all-other:
  iptables.append:
    - table: filter
    - chain: OUTPUT
    - jump: REJECT
    - proto: udp
    - save: True
    - require:
      - pkg: iptables

