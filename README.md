# Getting Started with Phoenix
Pluralsight | Nate Taylor

**NOTE:** This course came out in 2016. I am doing it using the most current versions of Elixir and Phoenix as of March 2019. Therefore, some of the code in my application differs from the tutorial on pluralsight

## 1: Course Overview
- We're building an event tracking application


----


## 2: What Is Phoenix

### 2-1: What Is Phoenix
- Based on Elixir which is written in Erlang
- Phoenix is NOT your application


### 2-2: Components of Phoenix
- Standard MVC Application Builder
- Other Components
  - Plugs
    - Allows you to interact with the conn
  - Channels
    - Allows soft real-time communication
- Prerequisites
  - Elixir
  - Node JS
  - PostgreSQL

### 2-3: Umbrella Application
- Below are all the commands you need to get started (once you have the prerequisite files)
```bash
# Create a new umbrella application
mix new application_name_umbrella --umbrella

# move into the apps folder of the application and run this to create a supervisor for your applications
mix new app_name --sup

# Create your Phoenix App with this command
mix phx.new app_name_web --no-ecto
# --no-ecto will omit Ecto from your Phoenix App. Which we want because we want the Supervisor interacting with the database, not the Phoenix app directly

# Start Your App at localhost:4000
mix phx.server

# Use IEX in your App
iex -S mix phx.server

```


----


## 3: Ecto Models & Migrations

### Creating a Database Table
mix ecto.gen.migration add_events_table

You can define up or down functions OR a change function for a migration

### Retrieving Data
`iex -S mix` to run the app in the terminal
`r(App.FunctionName)` to reload function

### Adding a record

`Rsvp.Events.changeset(%Rsvp.Events{}, %{date: "2016-11-22 00:00:00", title: "test"})`


----


## 4: Controllers and Views

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
- I would refer to these as `partials` but Sub-Template is fine
*NOTE:* I added the underscore to the beginning of the file names to indicate that it's a partial. This is not necessary but encouraged

#### Partials Within a directory

- In the `list.html.eex` file, replace the markup concerning each specific event and replace it with this line:
```elixir
  <%= render("_summary.html", event: e) %>
```
- Then create a `_summary.html.eex` file in the `events` folder and add this content
```elixir
<a href="<%= @event.id %>">
  <div class="list-item">
    <h4><%= @event.title %></h4>
    <p><%= @event.location %></p>
    <p><%= format_date(@event.date) %></p>
  </div>
</a>
```

#### Shared Partials

- Create a new file called `shared_view.ex` and add this to it:
```elixir
defmodule RsvpWebWeb.SharedView do
  use RsvpWebWeb, :view
end
```
- Move the `_count.html.eex` file to a new folder in `templates` called `shared`
- Rename `@events` to `@list` in the file
- Update the render function in `list.html.eex` to say this:
```elixir
<%= render RsvpWebWeb.SharedView, "_count.html", list: @events %>
```


### 5-4: Helpers


----


## 6: Putting It Together: Creating an Event

### 6-1: Putting It Together

### 6-2: Creating The Form

### 6-3: Handling User Submitted Data

### 6-4: Handling Form Errors


----


## 7: Plugs

### 7-1: What is a Plug

### 7-2: Creating a Cookie

### 7-3: Creating a Plug

### 7-4: Passing a Parameter


----


## 8: Channels: Real-Time Communication

### 8-1: Channels: Real-Time Communication

----


## 9: Deployment


----


## 10: Recap & Where to Go
