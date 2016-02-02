{% for user in pillar['users'] %}
{{ user['name'] }}_user:
  user.present:
    - name:   {{ user['name'] }}
    - shell:  /bin/zsh
{% endfor %}
