{% for user,user_props in pillar['users'].iteritems()
  if user_props['shell_conf'] is defined and user_props['shell_conf'] %}
{{ user }}_shell_config_directory:
  file.recurse:
    - name:       {{ salt['user.info'](user)['home'] }}/.shell-config
    - source:     salt://shell/shell-config
    - dir_mode:   0755
    - file_mode:  0644
    - user:       {{ user }}
    - group:      {{ user }}
{% endfor %}
# TODO : fix that user.info thing
