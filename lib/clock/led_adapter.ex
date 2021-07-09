defmodule Clock.LEDAdapter do
  defstruct [:module, :led]

  @type pin :: non_neg_integer()
  @type led_state() :: any()

  @callback open(pin()) :: led_state()
  @callback on(led_state()) :: led_state()
  @callback off(led_state()) :: led_state()

  def open(pin, module \\ from_env()) do
    %__MODULE__{module: module, led: module.open(pin)}
  end

  def on(adapter), do: %{adapter | led: adapter.module.on(adapter.led)}
  def off(adapter), do: %{adapter | led: adapter.module.off(adapter.led)}
  def set(adapter, true), do: on(adapter)
  def set(adapter, false), do: off(adapter)

  defp from_env, do: Application.get_env(:clock, :led_adapter)
end
