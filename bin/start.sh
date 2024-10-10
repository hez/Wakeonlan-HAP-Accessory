#!/bin/sh

cd /home/pi/wakeonlan_hap_accessory
. bin/config.sh
_build/prod/rel/wakeonlan_hap_accessory/bin/wakeonlan_hap_accessory start
