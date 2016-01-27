bash.pkg:
  pkg.installed:
    - name: bash

bashrc.file:
  file.managed:
    - name:   /root/.bashrc
    - source: salt://bash/bashrc
    - mode:   0644
    - user:   root
    - group:  root

bash.directory:
  file.recurse:
    - name:       /root/.bash
    - source:     salt://bash/bash
    - dir_mode:   0755
    - file_mode:  0644
    - user:       root
    - group:      root
