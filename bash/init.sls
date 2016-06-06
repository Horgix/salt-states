# Please Jinja, allow list comprehension, this ugliness makes me sad :(
# WTF we can't use set() either...

# So... we start building the list of shells to install
{% set shells_to_install = [] %}
# For each user and its properties
{% for user, user_props in pillar['users'].items() -%}
  # Add his/her shell to the ones to install
  {% if user_props['shell'] is defined
     and not user_props['shell'] in shells_to_install %}
      {% do shells_to_install.append(user_props['shell']) %}
  {%- endif %}
  # Finally, do concrete stuff.
  {% if loop.last %}
# Yes, I want this debugging for something so ugly
printpkgs:
  cmd.run:
    - name: "echo Shells to be installed: {{ shells_to_install }}"
    # If no shell is defined, still install bash
    {% if not shells_to_install %}
      {% do shells_to_install.append('bash') %}
    {% endif %}
    # Install shells
    {% for shell in shells_to_install %}
{{ shell }}_pkg:
  pkg.installed:
    - name: {{ pillar['pkgs'][shell] }}
    {% endfor %}
    # TODO : uninstall shells that we don't
  {%- endif %}
{%- endfor %}

{% for user,user_props in pillar['users'].iteritems()
  if user_props['shell'] is defined and user_props['shell'] == 'bash' %}

{% if user_props['bash_conf'] is defined and user_props['bash_conf'] %}
{{ user }}_bashrc_file:
  file.managed:
    - name:   {{ salt['user.info'](user)['home'] }}/.bashrc
    - source: salt://bash/bashrc
    - mode:   0644
    - user:   {{ user }}
    - group:  {{ user }}

{{ user }}_bash_directory:
  file.recurse:
    - name:       {{ salt['user.info'](user)['home'] }}/.bash
    - source:     salt://bash/bash
    - dir_mode:   0755
    - file_mode:  0644
    - user:       {{ user }}
    - group:      {{ user }}

{% endif %}
{% endfor %}
