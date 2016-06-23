# Avoid using multiple network daemons

{% for service in pillar['network']['services_to_stop'] %}
{{ service }}_service:
  service.dead:
    - name:     {{ service }}
    - enable:   False
{% endfor %}

