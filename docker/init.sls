docker_pkg:
  pkg.installed:
    - name: {{ pillar['pkgs']['docker'] }}

docker_service:
  service.running:
    - name:     docker
    - enable:   True
