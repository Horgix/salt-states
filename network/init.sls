{% for service in pillar['network']['services_to_stop'] %}
{{ service }}_service:
  service.dead:
    - name:     {{ service }}
    - enable:   False
{% endfor %}

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
{% endfor %}

dhcpd_conf:
  file.managed:
    - name:   /etc/dhcpd.conf
    - source: salt://network/dhcpd.conf.j2
    - mode:   0644
    - user:   root
    - group:  root
    - template: jinja
    - defaults:
      dns: {{ pillar['network']['dns'] }}

# TODO : enable profiles needed
# TODO : package dhcp + service
