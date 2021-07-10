defmodule Clock do
  @moduledoc """
  Documentation for Clock.
  """
  alias Clock.{Blinker, LEDAdapter}

  @default_wait 200

  def blink(gpio, times, wait \\ @default_wait) do
    gpio
    |> Blinker.open()
    |> Blinker.blink_times(times, wait)

    :ok
  end

  def async_blink(gpio, times, wait \\ @default_wait) do
    Task.async(fn ->
      blink(gpio, times, wait)
    end)
  end

  defdelegate on(led), to: LEDAdapter
  defdelegate off(led), to: LEDAdapter
  defdelegate set(led, true_or_false), to: LEDAdapter
end
