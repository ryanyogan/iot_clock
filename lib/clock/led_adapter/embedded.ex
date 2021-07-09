defmodule Clock.LEDAdapter.Embedded do
  alias Clock.LEDAdapter
  alias Circuits.GPIO

  @behaviour LEDAdapter

  @impl LEDAdapter
  def open(pin) do
    {:ok, led} = GPIO.open(pin, :output)
    led
  end

  @impl LEDAdapter
  def on(led) do
    GPIO.write(led, 1)
    led
  end

  @impl LEDAdapter
  def off(led) do
    GPIO.write(led, 0)
    led
  end
end
