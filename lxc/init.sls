lxc_pkgs:
  pkg.installed:
    - pkgs:
      {% for pkg in pillar['pkgs']['lxctools'] %}
      - {{ pillar['pkgs'][pkg] }}
      {% endfor %}

lxc_service:
  service.running:
    - name:     lxc
    - enable:   True
    - require:
      - pkg: lxc_pkgs

ovsdb_service:
  service.running:
    - name:     ovsdb-server
    - enable:   True
    - require:
      - pkg: lxc_pkgs

ovsvswitch_service:
  service.running:
    - name:     ovs-vswitchd.service
    - enable:   False
    - require:
      - pkg: lxc_pkgs

lxc_default_conf:
  file.managed:
    - name:   /etc/lxc/default.conf
    - source: salt://lxc/default.conf.j2
    - mode:   0644
    - user:   root
    - group:  root
    - template: jinja
    - defaults:
      ovsup_path: {{ salt['pillar.get']('lxc:network:ovs:ovsup_path') }}
      ovsdown_path: {{ salt['pillar.get']('lxc:network:ovs:ovsdown_path') }}

lxc_ovsup:
  file.managed:
    - name:   {{ salt['pillar.get']('lxc:network:ovs:ovsup_path') }}
    - source: salt://lxc/ovsup.sh.j2
    - mode:   0755
    - user:   root
    - group:  root
    - template: jinja
    - defaults:
      bridge: {{ salt['pillar.get']('lxc:network:ovs:bridge') }}

lxc_ovsdown:
  file.managed:
    - name:   {{ salt['pillar.get']('lxc:network:ovs:ovsdown_path') }}
    - source: salt://lxc/ovsdown.sh.j2
    - mode:   0755
    - user:   root
    - group:  root
    - template: jinja
    - defaults:
      bridge: {{ salt['pillar.get']('lxc:network:ovs:bridge') }}

include:
  - .dhcpd

# Enable IP forward
