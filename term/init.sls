urxvt_terminfo_pkg:
  pkg.installed:
    - name: {{ pillar['pkgs']['urxvt-terminfo'] }}

{% if pillar['xorghost'] is defined and pillar['xorghost'] %}
urxvt_pkg:
  pkg.installed:
    - name: {{ pillar['pkgs']['urxvt'] }}
{% endif %}
