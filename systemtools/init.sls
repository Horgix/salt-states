systemtools_pkgs:
  pkg.installed:
    - pkgs:
      {% for pkg in pillar['pkgs']['systemtools'] %}
      - {{ pillar['pkgs'][pkg] }}
      {% endfor %}
