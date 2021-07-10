import Config

config :clock,
  pins: %{0 => 21, 1 => 19, 2 => 6, 3 => 23, 4 => 12, 5 => 18},
  led_adapter: Clock.LEDAdapter.Embedded
