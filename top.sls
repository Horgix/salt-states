base:
  '*':
    - base
    - users
    - sudo
    - ssh
  #'edoras.horgix.fr':
  #  - network
  #'roles:docker_host':
  #  - match: grain
  #  - docker
  #'roles:lxc_host':
  #  - match: grain
  #  - lxc
  'roles:workstation':
    - match: grain
    - workstation
  'orthanc.horgix.fr,baraddur.horgix.fr,minasmorgul.horgix.fr':
    - match: list
    - docker
