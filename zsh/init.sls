zsh:
    pkg.installed:
      - name: zsh

/root/.zshrc:
  file.managed:
    - source: salt://zsh/zshrc
    - mode: 0644
    - user: root
    - group: root

/root/.zsh:
  file.recurse:
    - source: salt://zsh/zsh
    - dir_mode: 0755
    - file_mode: 0644
    - user: root
    - group: root
