apt-cacher-ng-pkg:
  pkg.installed:
    - name: apt-cacher-ng
  service.running:
    - name: apt-cacher-ng
    - enable: true

/var/cache/apt-cacher-ng:
  file.directory:
    - user: apt-cacher-ng

apt-cacher-ng-conf:
  file.managed:
    - source: salt://apt/templates/acng.conf
    - name: /etc/apt-cacher-ng/acng.conf
    - template: jinja
    - watch_in:
      service: apt-cacher-ng-pkg
