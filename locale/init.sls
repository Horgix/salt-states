pydbus.pkg:
  pkg.installed:
    - name: python2-dbus

locale_present:
  locale.present:
    - name: en_US.UTF-8

locale_enabled:
  locale.system:
    - name: en_US.UTF-8
