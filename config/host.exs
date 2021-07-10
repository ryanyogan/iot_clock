import Config
alias Clock.LEDAdapter

config :clock,
  pins: %{0 => 0, 1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5},
  led_adapter: if(Mix.env() == :test, do: LEDAdapter.Test, else: LEDAdapter.Dev)
