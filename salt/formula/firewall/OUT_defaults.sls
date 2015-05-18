iptables-out-established:
  iptables.append:
    - table: filter
    - chain: OUTPUT
    - jump: ACCEPT
    - match: state
    - connstate: ESTABLISHED,RELATED
    - proto: tcp
    - save: True
    - require:
      - pkg: iptables

iptables-out-lo-tcp:
  iptables.append:
    - table: filter
    - chain: OUTPUT
    - jump: ACCEPT
    - out-interface: lo
    - proto: tcp
    - save: True
    - require:
      - pkg: iptables

iptables-out-lo-udp:
  iptables.append:
    - table: filter
    - chain: OUTPUT
    - jump: ACCEPT
    - out-interface: lo
    - proto: udp
    - save: True
    - require:
      - pkg: iptables

iptables-out-tcp-http:
  iptables.append:
    - table: filter
    - chain: OUTPUT
    - jump: ACCEPT
    - proto: tcp
    - dport: 80
    - save: True
    - require:
      - pkg: iptables

iptables-out-tcp-https:
  iptables.append:
    - table: filter
    - chain: OUTPUT
    - jump: ACCEPT
    - proto: tcp
    - dport: 443
    - save: True
    - require:
      - pkg: iptables

iptables-out-tcp-dport-dnsallow:
  iptables.append:
    - table: filter
    - chain: OUTPUT
    - jump: ACCEPT
    - proto: tcp
    - dport: 53
    - save: True
    - require:
      - pkg: iptables

iptables-out-udp-dport-dnsallow:
  iptables.append:
    - table: filter
    - chain: OUTPUT
    - jump: ACCEPT
    - proto: udp
    - dport: 53
    - save: True
    - require:
      - pkg: iptables

iptables-out-tcp-sport-dnsallow:
  iptables.append:
    - table: filter
    - chain: OUTPUT
    - jump: ACCEPT
    - proto: tcp
    - sport: 53
    - save: True
    - require:
      - pkg: iptables

iptables-out-udp-sport-dnsallow:
  iptables.append:
    - table: filter
    - chain: OUTPUT
    - jump: ACCEPT
    - proto: udp
    - sport: 53
    - save: True
    - require:
      - pkg: iptables


iptables-out-ntp:
  iptables.append:
    - table: filter
    - chain: OUTPUT
    - jump: ACCEPT
    - proto: udp
    - dport: 123
    - save: True
    - require:
      - pkg: iptables

iptables_out_salt_4505:
  iptables.append:
    - table: filter
    - chain: OUTPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - proto: tcp
    - dport: 4505
    - save: True
    - require:
      - pkg: iptables

iptables_out_salt_4506:
  iptables.append:
    - table: filter
    - chain: OUTPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - proto: tcp
    - dport: 4506
    - save: True
    - require:
      - pkg: iptables

