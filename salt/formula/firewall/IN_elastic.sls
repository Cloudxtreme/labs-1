iptables_in_elastic:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - proto: tcp
    - dport: 9200:9300
    - save: True
    - require:
      - pkg: iptables
