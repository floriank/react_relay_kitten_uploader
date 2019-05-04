defmodule KittenGrapqhlWeb.Router do
  use KittenGrapqhlWeb, :router

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

  scope "/", KittenGrapqhlWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api" do
    if Mix.env() == :dev do
      forward "/graphiql", Absinthe.Plug.GraphiQL,
        schema: KittenGrapqhlWeb.Schema,
        json_codec: Jason
    end

    forward "/graph", Absinthe.Plug, schema: KittenGrapqhl.Schema, json_codec: Jason
  end
end
