defmodule OndeServerWeb.PageController do
  use OndeServerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
