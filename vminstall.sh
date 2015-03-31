POSE: Simple script to create a virtual machine (VM) on Ubuntu Server. MUST BE RUN AS ROOT
#
# AUTHOR: feedback[AT]HaveTheKnowHow[DOT]com
#
# NOTE: For an explanation of each of the arguments issue the following at a command prompt
#       and then change the arguments to suit your environment: vmbuilder kvm ubuntu --help
#
# IMPORTANT:
#	Once you have successfully built a VM using this script you MUST change the following arguments in the command below 
#	BEFORE creating another VM
#
#	--ip=192.168.1.201 \
#	--hostname MediaServer \

# NOTE: The script assigns a fixed IP address to your VM. If you want to get an IP address via DHCP then omit the following 
#       arguments from the command below.
#	--ip=192.168.1.201 \
#	--mask=255.255.255.0 \
#	--bcast=192.168.1.255 \
#	--gw=192.168.1.254 \
#
# IMPORTANT: If you want to assign a fixed ip address to your VM then you must obviously substitute your own network 
#            details in the --ip, --mask, --bcast and --gw arguments below
#
# Substitue the "/home/htkh/VirtualMachines" string for where you'd like your VMs to be created

vmbuilder kvm ubuntu \
	--dest=/home/htkh/VirtualMachines \
	--overwrite \
	--mem=1024 \
	--cpus=1 \
	--rootsize=7168 \
	--swapsize=1024 \
	--ip=192.168.1.201 \
	--mask=255.255.255.0 \
	--bcast=192.168.1.255 \
	--gw=192.168.1.254 \
	--addpkg=openssh-server \
	--addpkg=vim \
	--addpkg=cron \
	--addpkg=acpid \
	--arch=amd64 \
	--suite=lucid \
	--flavour virtual \
	--components main,universe,restricted \
	--hostname MediaServer \
	--user htkh \
	--pass mypassword \
	--libvirt qemu:///system \
	--bridge=br0 ;


