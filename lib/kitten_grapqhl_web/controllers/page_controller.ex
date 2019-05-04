defmodule KittenGrapqhlWeb.PageController do
  use KittenGrapqhlWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
