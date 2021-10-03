---
id: kxiIRHLAd5wWoz2STqma6
title: Display
desc: ''
updated: 1633199319500
created: 1633199319500
---
##archLinux Session handling

###     setup of the display manager
####   setup Nodm - minimal:autologin to standard user: low privileges

[nodm](https://github.com/spanezz/nodm) is an automatic display manager which automatically starts an X session at system boot. It is meant for devices like smartphones, but can be used on a regular computer as well, if the security implications are acceptable.

## Installation

[Install](https://wiki.archlinux.org/index.php/Install) the [nodm](https://www.archlinux.org/packages/?name=nodm) package.

## Usage

Now ensure no other display managers get started by [disabling](https://wiki.archlinux.org/index.php/Disabling) their systemd services.

After installing nodm, modify the `/etc/nodm.conf` file. Set the `NODM_USER` variable to the user which should be automatically logged in, and change the `NODM_XSESSION` variable to point to the script that starts your session. The `NODM_XSESSION` script must be executable!

/etc/nodm.conf

NODM_USER=*user*
NODM_XSESSION=/home/*user/.xinitrc*

[Enable](https://wiki.archlinux.org/index.php/Enable) `nodm.service` so *nodm* will be started on boot.

### Login session

For proper session handling, create pam.d file with the following content:

/etc/pam.d/nodm

#%PAM-1.0
auth      include   system-login
account   include   system-login
password  include   system-login
session   include   system-login
