iptables-in-default-reject:
  iptables.set_policy:
    - table: filter
    - chain: INPUT
    - policy: DROP

iptables-out-default-reject:
  iptables.set_policy:
    - table: filter
    - chain: OUTPUT
    - policy: DROP
