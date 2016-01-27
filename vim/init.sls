vim:
    pkg.installed

/root/.vimrc:
  file.managed:
    - source: salt://vim/vimrc
    - mode: 0644
    - user: root
    - group: root

/root/.vim:
  file.recurse:
    - source: salt://vim/vim
    - dir_mode: 0755
    - file_mode: 0644
    - user: root
    - group: root
