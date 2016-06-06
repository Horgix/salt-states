{% for user, user_props in pillar['users'].items() -%}
  {% if salt['pillar.get']('users:' + user + ':vim_conf', False) %}
{{ user }}_vimrc_file:
  file.managed:
    - name:   {{ salt['user.info'](user)['home'] }}/.vimrc
    - source: salt://users/files/vimrc
    - mode:   0644
    - user:   {{ user }}
    - group:  {{ user }}
    - require:
      - user: {{ user }}

{{ user }}_vim_directory:
  file.recurse:
    - name:       {{ salt['user.info'](user)['home'] }}/.vim
    - source:     salt://users/files/vim
    - dir_mode:   0755
    - file_mode:  0644
    - user:       {{ user }}
    - group:      {{ user }}
    - require:
      - user: {{ user }}
  {% endif %}
{% endfor %}
