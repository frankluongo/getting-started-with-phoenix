defmodule DopeWebWeb.PageController do
  use DopeWebWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
