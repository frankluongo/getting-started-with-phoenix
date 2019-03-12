defmodule RsvpWebWeb.Router do
  use RsvpWebWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  # pipeline :authorized do
  #   plug :browser
  #   plug RsvpWeb.AuthorizedPlug
  # end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RsvpWebWeb do
    pipe_through :browser

    # http verb "route", ControllerForTheRequest, :the_action_called

    get "/", PageController, :index

    get "/login", LoginController, :index
    post "/login", LoginController, :login
  end

  scope "/events", RsvpWebWeb do
    # pipe_through :authorized
    pipe_through :browser

    get "/", EventController, :list
    get "/new", EventController, :create
    post "/new", EventController, :add
    # Keep/:id the bottom so Elixir doesn't accidentally match on this when looking for /new
    get "/:id", EventController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", RsvpWebWeb do
  #   pipe_through :api
  # end
end
