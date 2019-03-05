## Phoenix Structure

Controller -> Model -> View -> Template

## Other Components
Plugs
- Allows you to interact with the conn

Channels
- Allows soft real-time communication

## Prerequisities
- Elixir
- Node JS
- PostgreSQL

## Getting Started

- `mix help` => Provides help
- `mix phx.new` => new Phoenix Project
- `mix phx.new.web` => new Phoenix Project within an Umbrella Application

### Create an Umbrella Application:
`mix new application_name_umbrella --umbrella`

Follow-up commands to create more stuff:
```
cd dope_app_umbrella
cd apps
mix new my_app
```
### Create a Supervising App
`mix new dope --sup`

Follow-up commands to use this:
```
cd dope
mix test
```

### Create Your Phoenix App
`mix phx.new dope_web --no-ecto`
- the `--no-ecto` will omit the Ecto Database wrapper

Follow-up Commands:
`cd dope_web`

Start your Phoenix app with:
`mix phx.server`
This will live at localhost:4000

run your app inside IEx (Interactive Elixir) as:
`iex -S mix phx.server`

# Ecto Models & Migrations

## Creating a Database Table
mix ecto.gen.migration add_events_table

You can define up or down functions OR a change function for a migration

## Retrieving Data
`iex -S mix` to run the app in the terminal
`r(App.FunctionName)` to reload function
