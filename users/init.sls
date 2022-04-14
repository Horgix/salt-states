{% for user, user_props in pillar['users'].items() %}
{{ user }}_user:
  user.present:
    - name:   {{ user }}
    - shell:  /bin/{{ salt['pillar.get']('users:' + user + ':shell', pillar['default_shell']) }}
    - groups:
    {% if user_props['sudoer'] is defined and user_props['sudoer'] %}
      - wheel
    {% endif %}
{% endfor %}

include:
  - .shell
  - .vim
  - .git
  {% if grains['roles'] is defined and 'workstation' in grains['roles'] %}
  - .xconf
  - .i3
  {% endif %}
