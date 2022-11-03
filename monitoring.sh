#!/bin/bash

BOOT_MIN=$(uptime -s | cut -d ":" -f 2)
BOOT_SEC=$(uptime -s | cut -d ":" -f 3)
DELAY=$(bc <<< $BOOT_MIN%10*60+$BOOT_SEC)
sleep $DELAY

## Creating aliases
arc=$(uname -a)

PCPU=$(grep "physical id" /proc/cpuinfo | wc -l)

VCPU=$(grep "processors" /proc/cpuinfo | wc -l)

TRAM=$(free | awk '$1 == "Mem:" {print $2}')
URAM=$(free | awk '$1 == "Mem:" {print $3}')
PRAM=$(free | awk '$1 == "Mem:" {printf("%.2f"), $3/$2*100}')

TMEM=$(df -Bg | grep '^/dev/' | grep -v '/boot$' | awk '{ft += $2} END {print ft}')
UMEM=$(df -Bm | grep '^/dev/' | grep -v '/boot$' | awk '{ut += $3} END {print ut}')
PMEM=$(df -Bm | grep '^/dev/' | grep -v '/boot$' | awk '{ut += $3} {ft += $2} END {print ut/ft*100}')

cpul=$(top -bn1 | grep '^%Cpu' | cut -c 9- | xargs | awk '{printf("%.1f%%"), $1 + $3}')

LBOOT=$(who -b | awk 'NR==1 {print $3 " " $4}')

LVM=$(if [ $(lsblk | grep "lvm" | wc -l) -eq 0] ; then echo no; else echo yes; fi)

ETCP=$(ss -t | grep "ESTAB" | wc -l)

USER=$(who | wc -l)
MAC=$(ip link show | awk '$1 == "link/ether" {print $2}')

SUDO=$(sudo cat /var/log/sudo/sudo.log | wc -l)

## shows the architecture of the OS and its Kernel Version.
echo Architecture: $arc

## Shows the number of physical processors
echo CPU physical : $PCPU

## shows the number of virtual processors
echo CPU virtual : $VCPU

echo Memory Usage: $URAM / $TRAM MB '('$PRAM %')'

echo Disk Usage: $UMEM / $TMEM GB '('$PMEM %')'

echo CPU Load: $cpul

echo Last Boot: $LBOOT

echo LVM use: $LVM

echo Connections TCP: $ETCP ESTABLISHED

echo User log: $USER

echo Network IP $MAC

echo Sudo: $SUDO cmd
