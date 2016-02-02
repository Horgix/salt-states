zsh_pkg:
  pkg.installed:
    - name: {{ pillar['pkgs']['zsh'] }}

{% for user in salt['pillar.get']('users', [])
  if user['zsh_conf'] is defined and user['zsh_conf'] %}
{{ user['name'] }}_zshrc_file:
  file.managed:
    - name:   {{ salt['user.info'](user['name'])['home'] }}/.zshrc
    - source: salt://zsh/zshrc
    - mode:   0644
    - user:   {{ user['name'] }}
    - group:  {{ user['name'] }}

{{ user['name'] }}_zsh_directory:
  file.recurse:
    - name:       {{ salt['user.info'](user['name'])['home'] }}/.zsh
    - source:     salt://zsh/zsh
    - dir_mode:   0755
    - file_mode:  0644
    - user:       {{ user['name'] }}
    - group:      {{ user['name'] }}
{% endfor %}
