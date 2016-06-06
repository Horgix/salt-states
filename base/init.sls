networktools_pkgs:
  pkg.installed:
    - pkgs:
      {% for pkg in pillar['pkgs']['networktools'] %}
      - {{ pillar['pkgs'][pkg] }}
      {% endfor %}

systemtools_pkgs:
  pkg.installed:
    - pkgs:
      {% for pkg in pillar['pkgs']['systemtools'] %}
      - {{ pillar['pkgs'][pkg] }}
      {% endfor %}
