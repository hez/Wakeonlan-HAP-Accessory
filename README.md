# HDMIHAPAccessory

A simple HAP (Homekit) service to send a WakeOnLan packet to a computer.

## Building

- `MIX_ENV=prod mix build`
- Restart service `sudo systemctl restart wakeonlan_hap_accessory.service`

### Configure

#### Application config

add your MAC and IPC addresses to `bin/config.sh`.

```bash
export MAC_ADDRESS="xx:xx:xx:xx:xx:xx"
export IP_ADDRESS="xxx.xxx.xxx.xxx"
export SECRET_KEY_BASE=xxx
```

### Installing service

- Copy service to systemd directory `sudo cp wakeonlan_hap_accessory.service /lib/systemd/system/`
- Restart systemd `sudo systemctl daemon-reload`
- Enable service `sudo systemctl enable wakeonlan_hap_accessory.service`
- And reboot

### Getting the HAP pairing code again

```elixir
HAP.Display.update_pairing_info_display()
```
