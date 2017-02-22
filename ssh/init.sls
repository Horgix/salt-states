{% for user, user_props in pillar['users'].iteritems() %}
{% if 'ssh_keys' in user_props %}
{{ user }}_sshdir:
  file.directory:
    - name:   {{ user_props['home'] }}/.ssh
    - mode:   0700
    - user:   {{ user }}
    - group:  {{ user }}

{{ user }}_authorized_keys:
  file.managed:
    - name:   {{ user_props['home'] }}/.ssh/authorized_keys
    - source: salt://ssh/files/authorized_keys.j2
    - mode:   0644
    - user:   {{ user }}
    - group:  {{ user }}
    - template: jinja
    - defaults:
        ssh_keys: {{ user_props['ssh_keys'] }}
{% endif %}
#{% if 'ssh_keys' in user_props %}
#{{ user }}_ssh_config:
#  file.managed:
#    - name:   {{ user_props['home'] }}/.ssh/config
#    - source: salt://ssh/files/ssh_config
#    - mode:   0644
#    - user:   {{ user }}
#    - group:  {{ user }}
#    - template: jinja
#
#{{ user }}_ssh_configs:
#  file.recurse:
#    - name:       {{ user_props['home'] }}/.ssh/configs
#    - source:     salt://ssh/files/ssh_configs
#    - dir_mode:   0755
#    - file_mode:  0644
#    - user:       {{ user }}
#    - group:      {{ user }}
#    - template:   jinja
#    - require:
#      - user: {{ user }}
#{% endif %}
{% endfor %}
