zsh_pkg:
  pkg.installed:
    - name: zsh

zshrc_file:
  file.managed:
    - name:   /root/.zshrc
    - source: salt://zsh/zshrc
    - mode:   0644
    - user:   root
    - group:  root

zsh_directory:
  file.recurse:
    - name:       /root/.zsh
    - source:     salt://zsh/zsh
    - dir_mode:   0755
    - file_mode:  0644
    - user:       root
    - group:      root
