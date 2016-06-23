include:
  - .cleanup

netctl_service:
  service.running:
    - name:     netctl
    - enable:   True

{% for interface in pillar['network']['interfaces'] %}
{{ interface }}_netctl_profile:
  file.managed:
    - name:   /etc/netctl/{{ interface }}
    - source: salt://network/netctl_profile.j2
    - mode:   0644
    - user:   root
    - group:  root
    - template: jinja
    - defaults:
      interface: {{ interface }}

{{ inteface }}_netctl_enable:
  ln -s '/etc/systemd/system/netctl@brwlan.service' '/etc/systemd/system/multi-user.target.wants/netctl@brwlan.service'


{% endfor %}
