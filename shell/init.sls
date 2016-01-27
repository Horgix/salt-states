shell-config.directory:
  file.recurse:
    - name:       /root/.shell-config
    - source:     salt://shell/shell-config
    - dir_mode:   0755
    - file_mode:  0644
    - user:       root
    - group:      root
