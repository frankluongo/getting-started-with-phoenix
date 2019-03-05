defmodule Rsvp.Events do
  use Ecto.Schema

  schema "events" do
    field :title, :string
    field :location, :string
    field :date, :naive_datetime

    timestamps()
  end
end
