{% set wm = pillar['wm'] %}
{{ wm }}_pkg:
  pkg.installed:
    - name: {{ pillar['pkgs'][wm] }}

workstation_tools_pkgs:
  pkg.installed:
    - pkgs:
      {% for pkg in pillar['pkgs']['workstation_tools'] %}
      - {{ pillar['pkgs'][pkg] }}
      {% endfor %}

{% if wm == 'i3' %}
i3status_pkg:
  pkg.installed:
    - name: {{ pillar['pkgs']['i3status'] }}

i3lock_pkg:
  pkg.installed:
    - name: {{ pillar['pkgs']['i3lock'] }}
#py3status_pkg:
#  pkg.installed:
#    - name: {{ pillar['pkgs']['py3status'] }}
{% endif %}

keymap_script:
  file.managed:
    - name:   /usr/local/bin/keymap.sh
    - source: salt://workstation/files/keymap.sh
    - mode:   0755
    - user:   root
    - group:  root
