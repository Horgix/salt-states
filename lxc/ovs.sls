ovsdb_service:
  service.running:
    - name:     ovsdb-server
    - enable:   False
    - require:
      - pkg: lxc_pkgs

ovsvswitch_service:
  service.running:
    - name:     ovs-vswitchd.service
    - enable:   True
    - require:
      - pkg: lxc_pkgs

