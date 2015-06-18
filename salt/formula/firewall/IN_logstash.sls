iptables_in_logstash:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - proto: tcp
    - dport: 8080
    - save: True
    - require:
      - pkg: iptables

iptables_in_logstash_rsyslog:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - proto: tcp
    - dport: 5000
    - save: True
    - require:
      - pkg: iptables

