defmodule DopeTest do
  use ExUnit.Case
  doctest Dope

  test "greets the world" do
    assert Dope.hello() == :world
  end
end
