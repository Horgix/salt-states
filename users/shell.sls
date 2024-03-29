# Please Jinja, allow list comprehension, this ugliness makes me sad :(
# WTF we can't use set() either...

# So... we start building the list of shells to install
{% set shells_to_install = [] %}
# For each user and its properties
{% for user, user_props in pillar['users'].items() -%}
  # If no shell is defined, say it's bash
  {% set shell_to_setup = salt['pillar.get']('users:' + user + ':shell', pillar['default_shell']) %}
  # Add their shell to the ones to install
  {% if not shell_to_setup in shells_to_install %}
    {% do shells_to_install.append(shell_to_setup) %}
  {%- endif %}
  # Configure their shell
  {% if user_props[shell_to_setup + '_conf'] is defined and user_props[shell_to_setup + '_conf'] %}
{{ user }}_{{ shell_to_setup }}rc_file:
  file.managed:
    - name:   {{ user_props['home'] }}/.{{ shell_to_setup }}rc
    - source: salt://users/files/{{ shell_to_setup }}rc
    - mode:   0644
    - user:   {{ user }}
    - group:  {{ user }}

{{ user }}_{{ shell_to_setup }}_directory:
  file.recurse:
    - name:       {{ user_props['home'] }}/.{{ shell_to_setup }}
    - source:     salt://users/files/{{ shell_to_setup }}
    - dir_mode:   0755
    - file_mode:  0644
    - user:       {{ user }}
    - group:      {{ user }}
    {% if shell_to_setup == 'zsh' %}
    - template: jinja
    - defaults:
      zsh_prompt_color: {{ pillar['zsh_prompt_color']|default('CYAN') }}
    {% endif %}
  {% endif %}

{{ user }}_shell_config_directory:
  file.recurse:
    - name:       {{ user_props['home'] }}/.shell-config
    - source:     salt://users/files/shell-config
    - dir_mode:   0755
    - file_mode:  0644
    - user:       {{ user }}
    - group:      {{ user }}

{{ user }}_p10k_file:
  file.managed:
    - name:   {{ user_props['home'] }}/.p10k.zsh
    - source: salt://users/files/p10k
    - mode:   0644
    - user:   {{ user }}
    - group:  {{ user }}
  # Finally, install needed shells
  {% if loop.last %}
# Yes, I want this debugging for something so ugly
#printpkgs:
#  cmd.run:
#    - name: "echo Shells to be installed: {{ shells_to_install }}"
#    # Install shells
    {% for shell in shells_to_install %}
{{ shell }}_pkg:
  pkg.installed:
    - name: {{ pillar['pkgs'][shell] }}
    {% endfor %}
    # TODO : uninstall shells that we don't, except bash
  {%- endif %}
{%- endfor %}
