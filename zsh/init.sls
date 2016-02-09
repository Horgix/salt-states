zsh_pkg:
  pkg.installed:
    - name: {{ pillar['pkgs']['zsh'] }}

{% for user,user_props in pillar['users'].iteritems()
  if user_props['zsh_conf'] is defined and user_props['zsh_conf'] %}
{{ user }}_zshrc_file:
  file.managed:
    - name:   {{ salt['user.info'](user)['home'] }}/.zshrc
    - source: salt://zsh/zshrc
    - mode:   0644
    - user:   {{ user }}
    - group:  {{ user }}

{{ user }}_zsh_directory:
  file.recurse:
    - name:       {{ salt['user.info'](user)['home'] }}/.zsh
    - source:     salt://zsh/zsh
    - dir_mode:   0755
    - file_mode:  0644
    - user:       {{ user }}
    - group:      {{ user }}
{% endfor %}
