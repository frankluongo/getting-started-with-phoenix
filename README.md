# Getting Started with Phoenix
Pluralsight | Nate Taylor

## 1: Course Overview
- We're building an event tracking application

## 2: What Is Phoenix

### 2-1: What Is Phoenix

### 2-2: Components of Phoenix

### 2-3: Umbrella Application

### 2-4: Live Reloading

### 2-5: What's On Tap

## 3: Ecto Models & Migrations

## 4: Controllers & Views: Fetching & Displaying Data


## Miscellaneous Notes
- Controller -> Model -> View -> Template

### Other Components
Plugs
- Allows you to interact with the conn

Channels
- Allows soft real-time communication

### Prerequisities
- Elixir
- Node JS
- PostgreSQL

### Getting Started

- `mix help` => Provides help
- `mix phx.new` => new Phoenix Project
- `mix phx.new.web` => new Phoenix Project within an Umbrella Application

#### Create an Umbrella Application:
`mix new application_name_umbrella --umbrella`

Follow-up commands to create more stuff:
```
cd dope_app_umbrella
cd apps
mix new my_app
```
#### Create a Supervising App
`mix new dope --sup`

Follow-up commands to use this:
```
cd dope
mix test
```

#### Create Your Phoenix App
`mix phx.new dope_web --no-ecto`
- the `--no-ecto` will omit the Ecto Database wrapper

Follow-up Commands:
`cd dope_web`

Start your Phoenix app with:
`mix phx.server`
This will live at localhost:4000

run your app inside IEx (Interactive Elixir) as:
`iex -S mix phx.server`

## Ecto Models & Migrations

### Creating a Database Table
mix ecto.gen.migration add_events_table

You can define up or down functions OR a change function for a migration

### Retrieving Data
`iex -S mix` to run the app in the terminal
`r(App.FunctionName)` to reload function

### Adding a record

`Rsvp.Events.changeset(%Rsvp.Events{}, %{date: "2016-11-22 00:00:00", title: "test"})`



## Controllers and Views

## Creating a View
Elixir/Phoenix know where to look for views and templates based on the name of the item.
- event_controller looks for event_view which looks for a folder named event to find files


----


## 5: Templates: Laying Out The View

### 5-1: Templates: Layout Out The View
- Templates are rendered using data from the view

### 5-2: Listing Events
- Create a page that lists all of our events

- In the `router.ex` file, define a new action that routes to the event controller and will handle showing the list
```elixir
get "/events", EventController, :list
```

- In the `event_controller.ex` file, add the `:list` function that will provide all the events
```elixir
  def list(conn, _params) do
    events = Rsvp.EventQueries.get_all
    render(conn, "list.html", events: events)
  end
```
- Create a new file called `list.html.eex` in the `events` folder and add this code to loop through the list of events provided:
*NOTE:* Since `list.html.eex` and `details.html.eex` both live in the `events` folder. They share the same `view` file and will both have access to the `format_date` function
```elixir
<h1>All Events</h1>
<ul class="list">
  <%= for e <- @events do %>
    <a href="<%= e.id %>">
      <div class="list-item">
        <h4><%= e.title %></h4>
        <p><%= e.location %></p>
        <p><%= format_date(e.date) %></p>
      </div>
    </a>
  <% end %>
</ul>
```





### 5-3: Sub-Templates

### 5-4: Helpers
