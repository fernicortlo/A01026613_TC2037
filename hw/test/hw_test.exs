defmodule HwTest do
  use ExUnit.Case
  doctest Hw

  test "greets the world" do
    assert Hw.hello() == :world
  end

  test "temperature conversion" do
    asset Hw.f_to_c(212) == 100
    asset Hw.f_to_c(0) == 32
    asset Hw.f_to_c(-40) == -40
  end
end
