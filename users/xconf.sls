{% for user, user_props in pillar['users'].items() -%}
{{ user }}_xinitrc:
  file.managed:
    - name:   {{ user_props['home'] }}/.xinitrc
    - source: salt://users/files/xinitrc
    - mode:   0644
    - user:   {{ user }}
    - group:  {{ user }}
    - require:
      - user: {{ user }}
{% endfor %}
