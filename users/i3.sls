{% for user, user_props in pillar['users'].items() -%}
  {% if salt['pillar.get']('users:' + user + ':x_conf', False) %}
{{ user }}_i3_config:
  file.recurse:
    - name:   {{ user_props['home'] }}/.config/i3
    - source: salt://users/files/i3
    - dir_mode:   0755
    - file_mode:  0644
    - user:   {{ user }}
    - group:  {{ user }}
    - require:
      - user: {{ user }}
  {% endif %}
{% endfor %}
