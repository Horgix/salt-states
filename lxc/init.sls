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
