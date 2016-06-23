lxc_pkgs:
  pkg.installed:
    - pkgs:
      {% for pkg in pillar['pkgs']['lxctools'] %}
      - {{ pillar['pkgs'][pkg] }}
      {% endfor %}

include:
  - .ovs
  - .lxc
  - .dhcpd
  - .haveged

ip_forward:
  sysctl.present:
    - name: net.ipv4.ip_forward
    - value: 1
    - config: /etc/sysctl.d/ip_forward.conf

ip_masquerade:
  iptables.append:
    - name: ip_masquerade
    - table: nat
    - chain: POSTROUTING
    - jump: MASQUERADE
    - out-interface: {{ pillar['lxc']['network']['ovs']['bridge'] }}
    - comment: "Masquerade LXC packets"
    - save: True

# Enable IP forward
