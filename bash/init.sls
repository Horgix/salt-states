/root/.bashrc:
  file.managed:
    - source: salt://bash/bashrc
    - mode: 0644
    - user: root
    - group: root

/root/.bash:
  file.recurse:
    - source: salt://bash/bash
    - dir_mode: 0755
    - file_mode: 0644
    - user: root
    - group: root
