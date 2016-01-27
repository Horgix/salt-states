git:
  pkg.installed:
    - name: git

/root/.gitconfig:
  file.managed:
    - source: salt://git/gitconfig
    - mode: 0644
    - user: root
    - group: root
