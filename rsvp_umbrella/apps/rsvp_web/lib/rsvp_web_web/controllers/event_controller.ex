defmodule RsvpWebWeb.EventController do
  # Phoenix gives you this :controller option to help you build controllers
  use RsvpWebWeb, :controller

  plug RsvpWeb.AuthorizedPlug, "create" when action in [:create]

  # All of these functions require two parameters, the connection and params sent along from the router
  def show(conn, %{"id" => id}) do
    event = Rsvp.EventQueries.get_by_id(id)
    |> IO.inspect()
    # Render takes three arguments, the conn, the template, and the data to be sent along
    render(conn, "details.html", event: event)

    # Text is a function. It renders out the text supplied as the second argument
    # text conn, "Events #{id}"
  end

  def create(conn, %{errors: errors}) do
    render(conn, "create.html", changeset: errors)
  end

  def create(conn, _params) do
    changeset = Rsvp.Events.changeset(%Rsvp.Events{}, %{})
    render(conn, "create.html", changeset: changeset)
  end

  def list(conn, _params) do
    events = Rsvp.EventQueries.get_all
    render(conn, "list.html", events: events)
  end

  def add(conn, %{"events" => events}) do
    naive_event_date = convert_date(events["date"])
    events = Map.replace!(events, "date", naive_event_date)

    changeset = Rsvp.Events.changeset(%Rsvp.Events{}, events)

    case Rsvp.EventQueries.create(changeset) do
      {:ok, %{id: id}} -> redirect(conn, to: Routes.event_path(conn, :show, id))
      {:error, reasons} -> create(conn, %{errors: reasons}) # Here, we call the create function again, passing it the errors
    end
  end

  def convert_date(date) do
    {_, new_date} = date <> ":00" |> NaiveDateTime.from_iso8601()
    new_date
  end

  def reserve(conn, %{"id" => id, "reservation" => %{"quantity" => quantity}}) do
    Rsvp.EventQueries.decrease_quantity(id, quantity)
    redirect(conn, to: Routes.event_path(conn, :show, id))
  end
end

# NaiveDateTime.from_iso8601("2019-04-01T12:00:00")
