pydbus_pkg:
  pkg.installed:
    - name: {{ pillar['pkgs']['python2-dbus'] }}

locale_present:
  locale.present:
    - name: en_US.UTF-8

locale_enabled:
  locale.system:
    - name: en_US.UTF-8
