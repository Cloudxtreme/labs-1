{% set hostname = grains['host'] -%}

iptables:
  pkg.installed:
    - name: iptables

iptables-persistent:
  pkg.installed:
    - name: iptables-persistent
    - require:
      - pkg: iptables

include:
  - .flush
  - .IN_defaults
  - .OUT_defaults
  - .IN_ssh
  {% if 'salt' in hostname -%}
  - .IN_salt
  {% endif -%}
  {% if 'elk' in hostname -%}
  - .IN_elastic
  - .IN_logstash
  - .IN_kibana
  {% endif -%}
  - .IN_logandreject
  - .OUT_logandreject
  - .policy
