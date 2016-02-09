{% for user, user_props in pillar['users'].iteritems() %}
{{ user }}_user:
  user.present:
    - name:   {{ user }}
    - shell:  /bin/zsh
    {% if user_props['sudoer'] is defined and user_props['sudoer'] %}
    - groups:
      - wheel
    {% endif %}
    {% if user_props['dockerer'] is defined and user_props['dockerer'] %}
    - groups:
      - docker
    {% endif %}
{% endfor %}
