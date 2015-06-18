iptables_out_tcp_elastic:
  iptables.append:
    - table: filter
    - chain: OUTPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - proto: tcp
    - dport: 9200:9300
    - save: True
    - require:
      - pkg: iptables

iptables_out_udp_elastic:
  iptables.append:
    - table: filter
    - chain: OUTPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - proto: udp
    - dport: 9200:9300
    - save: True
    - require:
      - pkg: iptables

iptables_out_elastic_zen:
  iptables.append:
    - table: filter
    - chain: OUTPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - proto: udp
    - dport: 54328
    - save: True
    - require:
      - pkg: iptables

