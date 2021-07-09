defmodule Clock.SimpleBlinker do
  alias Clock.LED

  @spec blink(reference(), number()) :: reference()
  def blink(led, wait) do
    LED.on(led)
    Process.sleep(wait)
    LED.off(led)
    Process.sleep(wait)

    led
  end

  @spec blink_times(reference(), number(), number()) :: any()
  def blink_times(led, times, wait) do
    Enum.reduce(1..times, led, fn _, led -> blink(led, wait) end)
  end
end
