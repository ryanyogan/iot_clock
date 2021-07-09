defmodule Clock.LED do
  @moduledoc """
  Acts as the hardware layer (naive with no adapter) for interfacing
  with the hardware.
  """
  alias Circuits.GPIO

  @spec open(number()) :: reference()
  def open(pin) do
    message("Opening #{pin}")
    {:ok, led} = GPIO.open(pin, :output)

    led
  end

  @spec on(reference()) :: reference()
  def on(led) do
    message("On: #{inspect(led)}")
    GPIO.write(led, 1)

    led
  end

  @spec off(reference()) :: reference()
  def off(led) do
    message("Off: #{inspect(led)}")
    GPIO.write(led, 0)

    led
  end

  @spec set(reference(), boolean()) :: reference()
  def set(led, true), do: on(led)
  def set(led, false), do: off(led)

  defp message(text) do
    IO.puts("--- #{text} ---")
  end
end
