iptables-in-default-reject:
  cmd.run:
    - name: iptables -P INPUT DROP
    - unless: iptables -L INPUT | head -1 | grep DROP
    - require:
      - pkg: iptables

iptables-out-default-reject:
  cmd.run:
    - name: iptables -P OUTPUT DROP
    - unless: iptables -L DROP | head -1 | grep DROP
    - require:
      - pkg: iptables
