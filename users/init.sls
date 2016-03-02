{% for user, user_props in pillar['users'].iteritems() %}
{{ user }}_user:
  user.present:
    - name:   {{ user }}
    {% if user_props['shell'] is defined %}
    - shell:  /bin/{{ user_props['shell'] }}
    {% endif %}
    - groups:
    {% if user_props['sudoer'] is defined and user_props['sudoer'] %}
      - wheel
    {% endif %}
{% endfor %}
