defmodule Clock.Core do
  defstruct [:time, leds: %{}]

  def new(leds, time \\ Time.utc_now().second) do
    %__MODULE__{time: time, leds: leds}
  end

  def tick(clock) do
    %__MODULE__{clock | time: rem(clock.time + 1, 60)}
  end

  def status(clock) do
    for bit <- 0..5,
        into: %{},
        do: {clock.leds[bit], on?(clock.time, bit)}
  end

  defp on?(time, bit) do
    1
    |> Bitwise.bsl(bit)
    |> Bitwise.band(time)
    |> Kernel.>(0)
  end
end
