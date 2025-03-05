network:
  version: 2
  renderer: networkd
  ethernets:
    eno1:
      dhcp4: no
      addresses:
        - 10.10.10.3/24
        - 192.168.0.2/24

