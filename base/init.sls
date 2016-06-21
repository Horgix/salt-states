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

basictools_plgs:
  pkg.installed:
    - pkgs:
      {% for pkg in pillar['pkgs']['basictools'] %}
      - {{ pillar['pkgs'][pkg] }}
      {% endfor %}

vim_pkg:
  pkg.installed:
    - name: {{ pillar['pkgs']['vim'] }}

{% if salt['pillar.get']('dediboxserial', False) %}
getty_service:
  service.running:
    - name:     getty@ttyS1
    - enable:   True
{% endif %}
