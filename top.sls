base:
  '*.horgix.fr':
    - base
    - users
    - term
    - sudo
    - ssh
  'pelargir.horgix.fr':
    - docker
  'edoras.horgix.fr':
    - lxc
    - docker
    - network
  '*':
    - base
    - users
    - term
    - sudo
    - ssh
