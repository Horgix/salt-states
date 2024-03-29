{% for user, user_props in pillar['users'].items() %}
{% if user_props['sudoer'] is defined and user_props['sudoer'] %}
sudo_{{ user }}_pkg:
  pkg.installed:
    - name: {{ pillar['pkgs']['sudo'] }}
{% endif %}
{% endfor %}

sudoers_file:
  file.managed:
    - name:   /etc/sudoers
    - source: salt://sudo/sudoers
    - mode:   0440
    - user:   root
    - group:  root
