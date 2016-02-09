vim_pkg:
  pkg.installed:
    - name: {{ pillar['pkgs']['vim'] }}

{% for user,user_props in pillar['users'].iteritems()
  if user_props['vim_conf'] is defined and user_props['vim_conf'] %}
{{ user }}_vimrc_file:
  file.managed:
    - name:   {{ salt['user.info'](user)['home'] }}/.vimrc
    - source: salt://vim/vimrc
    - mode:   0644
    - user:   {{ user }}
    - group:  {{ user }}
    - require:
      - user: {{ user }}

{{ user }}_vim_directory:
  file.recurse:
    - name:       {{ salt['user.info'](user)['home'] }}/.vim
    - source:     salt://vim/vim
    - dir_mode:   0755
    - file_mode:  0644
    - user:       {{ user }}
    - group:      {{ user }}
    - require:
      - user: {{ user }}
{% endfor %}
