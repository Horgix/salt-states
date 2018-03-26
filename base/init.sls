{% for toolclass in ['system', 'network', 'basic'] %}
{{ toolclass }}_tools_pkgs:
  pkg.installed:
    - pkgs:
      {% for pkg in pillar['pkgs'][toolclass + '_tools'] %}
      - {{ pillar['pkgs'][pkg] }}
      {% endfor %}
{% endfor %}

urxvt_terminfo_pkg:
  pkg.installed:
    - name: {{ pillar['pkgs']['urxvt-terminfo'] }}

{% if salt['pillar.get']('dedibox_serial_console', False) %}
getty_service:
  service.running:
    - name:     getty@ttyS1
    - enable:   True
{% endif %}

timesyncd_service:
  service.running:
    - name:     systemd-timesyncd
    - enable:   True
