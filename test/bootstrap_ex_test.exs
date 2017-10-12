defmodule BootstrapExTest do
  use ExUnit.Case
  doctest BootstrapEx

  test "greets the world" do
    assert BootstrapEx.hello() == :world
  end
end
