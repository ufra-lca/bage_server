defmodule OndeServerWeb.HorarioController do
  use OndeServerWeb, :controller

  alias OndeServer.Horarios
  alias OndeServer.Horarios.Horario

  def index(conn, _params) do
    horarios = Horarios.list_horarios()
    render(conn, "index.html", horarios: horarios)
  end

  def new(conn, _params) do
    changeset = Horarios.change_horario(%Horario{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"horario" => horario_params}) do
    case Horarios.create_horario(horario_params) do
      {:ok, horario} ->
        conn
        |> put_flash(:info, "Horario created successfully.")
        |> redirect(to: Routes.horario_path(conn, :show, horario))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    horario = Horarios.get_horario!(id)
    render(conn, "show.html", horario: horario)
  end

  def edit(conn, %{"id" => id}) do
    horario = Horarios.get_horario!(id)
    changeset = Horarios.change_horario(horario)
    render(conn, "edit.html", horario: horario, changeset: changeset)
  end

  def update(conn, %{"id" => id, "horario" => horario_params}) do
    horario = Horarios.get_horario!(id)

    case Horarios.update_horario(horario, horario_params) do
      {:ok, horario} ->
        conn
        |> put_flash(:info, "Horario updated successfully.")
        |> redirect(to: Routes.horario_path(conn, :show, horario))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", horario: horario, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    horario = Horarios.get_horario!(id)
    {:ok, _horario} = Horarios.delete_horario(horario)

    conn
    |> put_flash(:info, "Horario deleted successfully.")
    |> redirect(to: Routes.horario_path(conn, :index))
  end
end
