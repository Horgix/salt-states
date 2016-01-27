networktools_pkgs:
  pkg.installed:
    - pkgs:
      - openbsd-netcat  # netcat
      - tcpdump         # tcpdump
      - net-tools       # netstat
      - bind-tools      # dig
