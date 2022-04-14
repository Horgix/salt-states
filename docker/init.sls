docker_pkg:
  pkg.installed:
    - name: {{ pillar['pkgs']['docker'] }}

{% if grains['os'] == 'Arch' %}
docker_compose:
  pkg.installed:
    - name: {{ pillar['pkgs']['docker-compose'] }}
{% endif %}

docker_service:
  service.running:
    - name:     docker
    - enable:   True
    - require:
      - pkg: {{ pillar['pkgs']['docker'] }}
