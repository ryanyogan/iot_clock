defmodule CoreTest do
  use ExUnit.Case
  alias Clock.Core

  defp clock(time \\ 0) do
    Enum.zip(0..5, 1..6)
    |> Map.new()
    |> Core.new(time)
  end

  defp assert_pin(clock, led, state) do
    status = Core.status(clock)
    assert status[led] == state
    clock
  end

  test "clock ticks wrap from 59 seconds to 0" do
    wrapped_time =
      clock(59)
      |> Core.tick()
      |> Map.get(:time)

    assert wrapped_time == 0
  end

  test "sets LED states after ticks" do
    clock()
    |> assert_pin(1, false)
    |> assert_pin(2, false)
    |> Core.tick()
    |> assert_pin(1, true)
    |> assert_pin(2, false)
    |> Core.tick()
    |> assert_pin(1, false)
    |> assert_pin(2, true)
    |> Core.tick()
    |> assert_pin(1, true)
    |> assert_pin(2, true)
  end
end
