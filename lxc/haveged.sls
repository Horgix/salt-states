haveged_service:
  service.running:
    - name:     haveged
    - enable:   True
    - require:
      - pkg: lxc_pkgs
