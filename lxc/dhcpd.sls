dhcpd_pkg:
  pkg.installed:
    - name: {{ pillar['pkgs']['dhcpd'] }}

# TODO: improve this
dhcpd_conf:
  file.managed:
    - name:   /etc/dhcpd.conf
    - source: salt://lxc/dhcpd.conf.j2
    - mode:   0644
    - user:   root
    - group:  root
    - template: jinja
    - defaults:
      dns: {{ pillar['network']['dns'] }}

dhcpd_service:
  service.running:
    - name:     dhcpd4
    - enable:   True
