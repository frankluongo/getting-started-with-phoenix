defmodule RsvpWebWeb.EventViewTest do
  use RsvpWebWeb.ConnCase, async: true

  @tag current: true
  test "Should convert a date to M/D/YYYY format" do
    date = ~N[1992-06-05 15:00:00]
    formatted = RsvpWebWeb.EventView.format_date(date)
    assert formatted = "06/5/1992"
  end
end
