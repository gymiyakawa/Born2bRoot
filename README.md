# Born2bRoot #
List of useful commands as well as the script used in Born2bRoot for 42Quebec in 2022

## 


## Useful Commands ##

verify instalattion:
` dpkg -l | grep ** <name.of.app> **`

check mounted partitions:
`lslblk`

### Sudo ###
Configure using `sudo visudo` only!

### UFW ###
`sudo ufw enable`
`sudo ufw status`

`sudo ufw allow ** <portnumber> **`

two step-delete: `sudo ufw status numbered` then `sudo ufw delete ** <number> **`

### Local Host ###
check name: `sudo hostname`

check IP: `sudo hostname -I`

change hostname: edit /etc/hostname 
eg: `sudo vim /etc/hostname` then `sudo reboot` 

### User Management ###
Create new User:
`sudo adduser ** <newusername> **`

Verify with:
`getent passwd ** <usernanme> **`

Verify password expiry info:
`sudo chage -l ** <username> **`


Remove User:
`sudo userdel ** <username> **`
use modifier `-r` if you want to also delete user's home directory and mail spool.

Changing Password:
`sudo passwd ** <username> **`

## Group Management ##
Create new group:
`sudo add group ** <group.name> **`

Add a user to a group:
`sudo add user ** <username> ** **<group.name>**`

Verify members of specific group:
`getent group ** <group.name> **`

Verify which groups current user is part of:
`groups`

## Managing Password Policies ##
Make sure _libpam-pwdquality_ is installed

configure it by editing _/etc/pam.d/common-password_

eg. `sudo vim /etc/pam.d/common-password`

same for _etc/login.defs_
