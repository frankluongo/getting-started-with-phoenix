defmodule RsvpWebWeb.EventController do
  # Phoenix gives you this :controller option to help you build controllers
  use RsvpWebWeb, :controller

  # All of these functions require two parameters, the connection and params sent along from the router
  def show(conn, params) do
    # Render takes three arguments, the conn, the template, and the data to be sent along
    render(conn, "details.html", data: "Events #{params["id"]}")

    # Text is a function. It renders out the text supplied as the second argument
    # text conn, "Events #{params["id"]}"
  end
end
