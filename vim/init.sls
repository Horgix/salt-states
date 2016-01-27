vim.pkg:
  pkg.installed:
    - name: vim

vimrc.file:
  file.managed:
    - name:   /root/.vimrc
    - source: salt://vim/vimrc
    - mode:   0644
    - user:   root
    - group:  root

vim.directory:
  file.recurse:
    - name:       /root/.vim
    - source:     salt://vim/vim
    - dir_mode:   0755
    - file_mode:  0644
    - user:       root
    - group:      root
