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
    - source: salt://ssh/authorized_keys.j2
    - mode:   0644
    - user:   {{ user }}
    - group:  {{ user }}
    - template: jinja
    - defaults:
        ssh_keys: {{ user_props['ssh_keys'] }}
{% endif %}
{% endfor %}
