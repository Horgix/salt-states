# On Fedora, add the official Docker Repository
# ... the official packaged version is full of WTF
{% if grains['os'] == 'Fedora' %}
docker_repo:
  pkgrepo.managed:
    - name:       docker
    - humanname:  Docker Repository - Fedora $releasever
    - baseurl:    https://yum.dockerproject.org/repo/main/fedora/$releasever/
    - enabled:    1
    - gpgcheck:   1
    - gpgkey:     https://yum.dockerproject.org/gpg
{% endif %}

docker_pkg:
  pkg.installed:
    - name: {{ pillar['pkgs']['docker'] }}
    {% if grains['os'] == 'Fedora' -%}
    - require:
      - pkgrepo: docker
    {% endif %}

{% if grains['os'] == 'Fedora' %}
docker_compose:
  file.managed:
    - name:   /usr/local/sbin/docker-compose
    - source: salt://docker/docker-compose.sh
    - mode:   0755
    - user:   root
    - group:  root
{% elif grains['os'] == 'Arch' %}
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
