defmodule OndeServerWeb.Api.HorarioController do
  use OndeServerWeb, :controller

  alias OndeServer.Horarios
  alias OndeServer.Horarios.Horario

  action_fallback OndeServerWeb.FallbackController

  def index(conn, _params) do
    horarios = Horarios.list_horarios()
    render(conn, "index.json", horarios: horarios)
  end

  def create(conn, %{"horario" => horario_params}) do
    with {:ok, %Horario{} = horario} <- Horarios.create_horario(horario_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.api_horario_path(conn, :show, horario))
      |> render("show.json", horario: horario)
    end
  end

  def show(conn, %{"id" => id}) do
    horario = Horarios.get_horario!(id)
    render(conn, "show.json", horario: horario)
  end

  def update(conn, %{"id" => id, "horario" => horario_params}) do
    horario = Horarios.get_horario!(id)

    with {:ok, %Horario{} = horario} <- Horarios.update_horario(horario, horario_params) do
      render(conn, "show.json", horario: horario)
    end
  end

  def delete(conn, %{"id" => id}) do
    horario = Horarios.get_horario!(id)

    with {:ok, %Horario{}} <- Horarios.delete_horario(horario) do
      send_resp(conn, :no_content, "")
    end
  end
end
