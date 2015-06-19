base:

  '*':
    - servers.common

  'salt-master*':
    - salt.master

  'elk*':
    - elk.elastic
    - elk.logstash
    - elk.kibana

  'es*':
    - elk.elastic

  'aptcacher*':
    - apt.proxy
