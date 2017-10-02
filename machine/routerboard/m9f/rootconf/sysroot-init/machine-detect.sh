#!/bin/sh
. /lib/onie/functions

[ -r /lib/onie/sysinfo-arch ]     && . /lib/onie/sysinfo-arch
[ -r /lib/onie/sysinfo-platform ] && . /lib/onie/sysinfo-platform

eth0_macaddr="none"

if type get_ethaddr | grep -q 'shell function' > /dev/null 2>&1 ; then
   eth0_macaddr=$(get_ethaddr)
elif type get_ethaddr_arch | grep -q 'shell function' > /dev/null 2>&1 ; then
   eth0_macaddr=$(get_ethaddr_arch)
fi

eth0_vendor_prefix=$(echo ${eth0_macaddr} | grep ":" | cut -d':' -f 1,2,3)

platform="wildix"

case ${eth0_vendor_prefix} in
   "9C:75:14")
      platform="wildix"
      ;;
   "00:90:27")
      platform="wildix"
      ;;
   *)
      platform="generic"
      ;;
esac

if [ "${platform}" == "wildix" ]; then
   echo 'onie_machine="wildix-m9f"' >> /etc/machine-live.conf
	log_info_msg "Platform wildix_M9F detected ..."
fi
