iptables-in-default-accept:
  iptables.set_policy:
    - table: filter
    - chain: INPUT
    - policy: ACCEPT
    - require:
      - pkg: iptables

iptables-out-default-accept:
  iptables.set_policy:
    - table: filter
    - chain: OUTPUT
    - policy: ACCEPT
    - require:
      - pkg: iptables

iptables-flush:
  iptables.flush
