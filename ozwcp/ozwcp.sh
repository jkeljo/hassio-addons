#!/bin/bash -e
source /usr/lib/hassio-addons/base.sh

# Link options.xml from /config/ (used by OZW within Home Assistant) to
# the OZW used by OZWCP, so that they both will use the same options.
ln -fs /config/options.xml /root/open-zwave/config/options.xml

# Edit options.xml to force OZW to use /config/ for its user directory
# (where it puts logs, scene config, network cache). Home Assistant does
# this through other means; putting it in options.xml makes sure that OZWCP
# will look in the same place.
xmlstarlet ed -L -N x="http://code.google.com/p/open-zwave/"\
	   -d '/x:Options/x:Option[@name="UserPath"]'\
	   -s '/x:Options' -t elem -n NewOption\
	   -i '/x:Options/NewOption' -t attr -n name -v UserPath\
	   -i '/x:Options/NewOption' -t attr -n value -v "/config/"\
	   -r '/x:Options/NewOption' -v Option\
	   /config/options.xml

# The part of OZW that *writes* the log respects the UserPath setting in options.xml
# However, OZWCP's web interface expects to find it in its working directory (and its
# working directory must be the ozwcp repo), so we link it.
ln -fs /config/OZW_Log.txt /root/open-zwave-control-panel/OZW_Log.txt

hass.log.info "Stopping hass.io to avoid network, config, and log conflicts..."
hass.api.homeassistant.stop

hass.log.info "Starting ozwcp..."
/root/open-zwave-control-panel/ozwcp

