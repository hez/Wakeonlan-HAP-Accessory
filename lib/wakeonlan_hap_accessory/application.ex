defmodule WakeonlanHAPAccessory.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      WakeonlanHAPAccessory.HAP.Computer,
      {HAP,
       %HAP.AccessoryServer{
         name: "Computer",
         model: "unknown",
         identifier: "11:22:33:44:11:78",
         accessory_type: 7,
         accessories: [
           %HAP.Accessory{
             name: "Computer",
             services: [
               %HAP.Services.Switch{
                 name: "Gaming Computer",
                 on: {WakeonlanHAPAccessory.HAP.Computer, :on}
               }
             ]
           }
         ]
       }}
    ]

    Logger.add_handlers(:hdmi_hap_accessory)
    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: WakeonlanHAPAccessory.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
