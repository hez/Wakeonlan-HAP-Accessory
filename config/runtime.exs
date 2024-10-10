import Config

config :wakeonlan_hap_accessory, HAP.Computer,
  mac_address: System.get_env("MAC_ADDRESS"),
  ip_address: System.get_env("IP_ADDRESS")
