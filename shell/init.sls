/root/.shell-config:
  file.recurse:
    - source: salt://shell/shell-config
    - dir_mode: 0755
    - file_mode: 0644
    - user: root
    - group: root
