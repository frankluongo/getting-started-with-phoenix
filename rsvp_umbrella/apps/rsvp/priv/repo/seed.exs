unless(Rsvp.EventQueries.any) do
  Rsvp.EventQueries.create(Rsvp.Events.changeset(%Rsvp.Events{}, %{date: "2020-05-23 09:00:00", title: "Summer Codefest", location: "Omaha, NE"}))
  Rsvp.EventQueries.create(Rsvp.Events.changeset(%Rsvp.Events{}, %{date: "2020-06-19 09:00:00", title: "Charles Spurgeon's Birthday", location: "London"}))
end
