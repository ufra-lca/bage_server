defmodule OndeServerWeb.BageController do
  use OndeServerWeb, :controller

  alias OndeServer.GeoLocation
  alias OndeServer.GeoLocation.Bage

  action_fallback OndeServerWeb.FallbackController

  def index(conn, _params) do
    bages = GeoLocation.list_bages()
    render(conn, "index.json", bages: bages)
  end

  def create(conn, %{"bage" => bage_params}) do
    with {:ok, %Bage{} = bage} <- GeoLocation.create_bage(bage_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.bage_path(conn, :show, bage))
      |> render("show.json", bage: bage)
    end
  end

  def show(conn, %{"id" => id}) do
    bage = GeoLocation.get_bage!(id)
    render(conn, "show.json", bage: bage)
  end

  def update(conn, %{"bage" => bage_params}) do
    case GeoLocation.get_bage_by_one_signal(bage_params["one_signal"]) do
      nil ->
        with {:ok, %Bage{} = bage_new} <- GeoLocation.create_bage(bage_params) do
          render(conn, "show.json", bage: bage_new)
        end

      bage ->
        with {:ok, %Bage{} = bage_new} <- GeoLocation.update_bage(bage, bage_params) do
          render(conn, "show.json", bage: bage_new)
        end
    end
  end

  def delete(conn, %{"id" => id}) do
    bage = GeoLocation.get_bage!(id)

    with {:ok, %Bage{}} <- GeoLocation.delete_bage(bage) do
      send_resp(conn, :no_content, "")
    end
  end
end
