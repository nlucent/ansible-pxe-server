#version=DEVEL
install
url --url="ftp://172.168.1.2/pub/centos7"

# System authorization information
auth --enableshadow --passalgo=sha512
# Use graphical install
graphical
# Run the Setup Agent on first boot
firstboot --enable
#ignoredisk --only-use=vda
# Keyboard layouts
keyboard --vckeymap=us --xlayouts='us'
# System language
lang en_US.UTF-8

# Network information
network  --bootproto=static --ip=10.9.25.254 --netmask=255.255.255.0 --gateway=10.9.25.1 --nameserver=10.9.25.1 --ipv6=auto --activate
network  --hostname=localhost.localname

# Root password
rootpw --iscrypted $6$QZEjNzIwmNrEWzSp$j5iwScl6XGcbcxRGwLIS5JOQZyQ46ENlHGU7VI81ilIgwzImxgxkhHrIJPee3U/kh5tMIkI0ZKY.d5K0Lv4yZ.
# System services
services --enabled="chronyd"
# System timezone
timezone America/Denver --isUtc --ntpservers=ipa.nicknet.io,pfrouter.nicknet
# System bootloader configuration
#bootloader --location=mbr --boot-drive=vda
autopart --type=lvm
# Partition clearing information
clearpart --none --initlabel

%packages
@^minimal
@core

%end

%addon com_redhat_kdump --disable --reserve-mb='auto'

%end

%anaconda
pwpolicy root --minlen=6 --minquality=1 --notstrict --nochanges --notempty
pwpolicy user --minlen=6 --minquality=1 --notstrict --nochanges --emptyok
pwpolicy luks --minlen=6 --minquality=1 --notstrict --nochanges --notempty
%end
