git_pkg:
  pkg.installed:
    - name: {{ pillar['pkgs']['git'] }}

gitconfig_file:
  file.managed:
    - name:   /root/.gitconfig
    - source: salt://git/gitconfig
    - mode:   0644
    - user:   root
    - group:  root
