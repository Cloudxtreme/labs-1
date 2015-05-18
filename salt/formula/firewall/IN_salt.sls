iptables_in_salt_4505:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - proto: tcp
    - dport: 4505
    - save: True
    - require:
      - pkg: iptables

iptables_in_salt_4506:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - proto: tcp
    - dport: 4506
    - save: True
    - require:
      - pkg: iptables

