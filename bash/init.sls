# Please Jinja, allow list comprehension, this ugliness makes me sad :(
{% set should_install_bash = False %}
{% for user, user_props in pillar['users'].items() -%}
  {% if user_props['shell'] is defined -%}
    {% if user_props['shell'] == 'bash' -%}
      {% set should_install_bash = True %}
    {%- endif -%}
    {% if loop.last -%}
      {% if should_install_bash %}
bash_pkg:
  pkg.installed:
    - name: {{ pillar['pkgs']['bash'] }}
      {%- endif %}
    {%- endif %}
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
