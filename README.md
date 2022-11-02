# Born2bRoot #
This is my submitted project for Born2bRoot at 42 Quebec in 2022.

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
