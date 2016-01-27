git.pkg:
  pkg.installed:
    - name: git

gitconfig.file:
  file.managed:
    - name:   /root/.gitconfig
    - source: salt://git/gitconfig
    - mode:   0644
    - user:   root
    - group:  root
