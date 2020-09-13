# Open ZWave Control Panel (OZWCP) Add-on for Hass.io
This add-on installs [Open ZWave Control Panel](https://github.com/OpenZWave/open-zwave-control-panel) on [Hass.io](https://www.home-assistant.io/hassio/), sharing its configuration with Home Assistant.

For most purposes, the ZWave configuration UI embedded in Home Assistant is just fine, but sometimes you just want OZWCP.

## Installation

**IMPORTANT**: OZWCP and Home Assistant cannot both be accessing the ZWave controller and Open ZWave cache at the same time. The add-on will stop Home Assistant before starting OZWCP, but it's up to you to close OZWCP's connection to the ZWave controller before starting Home Assistant again.

1. [Add `https://github.com/jkeljo/hassio-addons` to your Hass.io instance as a repository](https://www.home-assistant.io/hassio/installing_third_party_addons/)
2. Install the OZWCP addon. This is a local-build addon, so installation can take **a long time** (10 minutes or more). Be patient! :-)

## Use
1. Start the OZWCP addon. This will stop Home Assistant, and then start OZWCP.
2. OZWCP will come up on port 8090. For the default Hass.io setup, that's [http://hassio.local:8090](http://hassio.local:8090)
3. When you're done with OZWCP, click the Close button to close its connection to your ZWave controller
4. Start Home Assistant again by [`ssh`ing into the host](https://community.home-assistant.io/t/community-hass-io-add-on-ssh/33820?u=frenck) and running `hassio homeassistant start` (this may also be `ha core start` on some installations).
5. Manually stop the OZWCP addon so you won't accidentally try to use it while Home Assistant is running

## Changing the version of OpenZWave and/or OZWCP
`build.json` specifies which repository and which commit to use for OpenZWave and OZWCP, so it's easy to update for a newer version or even to use a fork. I'll happily accept PRs to pick up new versions. 

If you've got customizations to OpenZWave and wish to use your fork, you can do that too! Just fork this repo and set your Home Assistant to install from there. Then you can change `build.json` to use your OpenZWave and/or OZWCP fork.
