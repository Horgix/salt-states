{% for user, user_props in pillar['users'].items() -%}
  {% if salt['pillar.get']('users:' + user + ':git_conf', False) %}
{{ user }}_gitconfig_file:
  file.managed:
    - name:   {{ salt['user.info'](user)['home'] }}/.gitconfig
    - source: salt://users/files/gitconfig.j2
    - mode:   0644
    - user:   {{ user }}
    - group:  {{ user }}
    - template: jinja
    - defaults:
      - fullname: user_props['fullname']
      - email: user_props['email']
    - require:
      - user: {{ user }}
  {% endif %}
{% endfor %}
