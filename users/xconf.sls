{% if pillar['xorghost'] is defined and pillar['xorghost'] -%}
  {% for user, user_props in pillar['users'].items() -%}
    {% if salt['pillar.get']('users:' + user + ':x_conf', False) %}
{{ user }}_xconf_directory:
  file.recurse:
    - name:   {{ user_props['home'] }}/.xconf
    - source: salt://users/files/xconf
    - dir_mode:   0755
    - file_mode:  0644
    - user:   {{ user }}
    - group:  {{ user }}
    - require:
      - user: {{ user }}
    {% endif %}
  {% endfor %}
{% endif %}
