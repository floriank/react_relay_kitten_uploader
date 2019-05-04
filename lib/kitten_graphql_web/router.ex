defmodule KittenGraphqlWeb.Router do
  use KittenGraphqlWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :graphql do
    plug Plug.Parsers,
      parsers: [:urlencoded, :multipart, :json, Absinthe.Plug.Parser],
      pass: ["*/*"],
      json_decoder: Jason
  end

  scope "/", KittenGraphqlWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api" do
    pipe_through(:graphql)

    if Mix.env() == :dev do
      forward "/graphiql", Absinthe.Plug.GraphiQL,
        schema: KittenGraphqlWeb.Schema,
        json_codec: Jason
    end

    forward "/graph", Absinthe.Plug, schema: KittenGraphqlWeb.Schema, json_codec: Jason
  end
end
