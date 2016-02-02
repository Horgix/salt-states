networktools_pkgs:
  pkg.installed:
    - pkgs:
      {% for pkg in pillar['pkgs']['networktools'] %}
      - {{ pillar['pkgs'][pkg] }}
      {% endfor %}
