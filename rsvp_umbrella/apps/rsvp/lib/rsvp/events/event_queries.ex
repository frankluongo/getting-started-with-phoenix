defmodule Rsvp.EventQueries do
  import Ecto.Query

  alias Rsvp.{Repo, Events}

  def any do
    # Here we check if there are any events in the table
    Repo.one(from e in Events, select: count(e.id)) != 0
  end

  def get_all do
    Repo.all(from Events)
  end

  def get_all_for_location(location) do
    query = from e in Events,
      # Adding the carot tells Elixir that I want the value that location represents
      where: e.location == ^location
    Repo.all(query)
  end

  def get_by_id(id) do
    Repo.get(Events, id)
  end

  def create(event) do
    Repo.insert(event)
  end

  def decrease_quantity(id, quantity) do
    event = Repo.get!(Events, id)
    changes = Ecto.Changeset.change event, quantity_available:
    event.quantity_available - String.to_integer(quantity)
    Repo.update changes
  end

end
