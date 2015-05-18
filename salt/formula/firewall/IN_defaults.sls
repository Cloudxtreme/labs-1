iptables-in-established:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: ESTABLISHED,RELATED
    - proto: tcp
    - save: True
    - require:
      - pkg: iptables

iptables-in-lo-tcp:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - in-interface: lo
    - proto: tcp
    - save: True
    - require:
      - pkg: iptables

iptables-in-lo-udp:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - in-interface: lo
    - proto: udp
    - save: True
    - require:
      - pkg: iptables

iptables-in-ping:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - proto: icmp
    - save: True
    - require:
      - pkg: iptables

iptables-in-dnsallow:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - proto: udp
    - source-port: 53
    - save: True
    - require:
      - pkg: iptables

