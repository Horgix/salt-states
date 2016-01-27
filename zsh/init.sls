zsh.pkg:
  pkg.installed:
    - name: zsh

zshrc.file:
  file.managed:
    - name:   /root/.zshrc
    - source: salt://zsh/zshrc
    - mode:   0644
    - user:   root
    - group:  root

zsh.directory:
  file.recurse:
    - name:       /root/.zsh
    - source:     salt://zsh/zsh
    - dir_mode:   0755
    - file_mode:  0644
    - user:       root
    - group:      root
