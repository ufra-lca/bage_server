defmodule OndeServerWeb.Router do
  use OndeServerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", OndeServerWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", OndeServerWeb do
    pipe_through :api
    put "/bages", BageController, :update
    get "/bages", BageController, :index
  end
end