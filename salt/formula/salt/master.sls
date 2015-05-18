{% set salthiera_version = salt['pillar.get']('salthiera_version') %}

rubygems-integration:
  pkg.installed

gem-salthiera:
  cmd.run:
    - unless: /usr/bin/gem list | grep -q "^salthiera ({{ salthiera_version }})"
    - name: /usr/bin/gem install salthiera -v {{ salthiera_version }} --no-rdoc --no-ri && /usr/bin/gem uninstall salthiera --version '<{{ salthiera_version }}'
    - require:
      - pkg: rubygems-integration

