defmodule BlinkerTest do
  use ExUnit.Case
  alias Clock.Blinker

  test "track blinks" do
    adapter = Blinker.open(0)
    %{led: actual} = Blinker.blink_times(adapter, 2, 1)

    expected = [:open, :on, :off, :on, :off]
    assert Enum.reverse(actual.history) == expected
  end
end
