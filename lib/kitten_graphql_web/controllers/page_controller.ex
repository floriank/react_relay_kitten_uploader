defmodule KittenGraphqlWeb.PageController do
  use KittenGraphqlWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
