defmodule Clock.LEDAdapter.Dev do
  alias Clock.LEDAdapter
  require Logger

  defstruct pin: 0, lit: false

  @behaviour LEDAdapter

  @impl LEDAdapter
  def open(pin) do
    Logger.info("Opening: #{pin}")
    %__MODULE__{pin: pin, lit: false}
  end

  @impl LEDAdapter
  def on(led) do
    Logger.info("On: #{led.pin}")
    %{led | lit: true}
  end

  @impl LEDAdapter
  def off(led) do
    Logger.info("Off: #{led.pin}")
    %{led | lit: false}
  end
end
