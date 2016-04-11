lxc_pkg:
  pkg.installed:
    - name: {{ pillar['pkgs']['lxc'] }}

lxc_service:
  service.running:
    - name:     lxc
    - enable:   True
    - require:
      - pkg: {{ pillar['pkgs']['lxc'] }}
