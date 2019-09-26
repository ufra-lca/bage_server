defmodule OndeServerWeb.Api.HorarioControllerTest do
  use OndeServerWeb.ConnCase

  alias OndeServer.Horarios
  alias OndeServer.Horarios.Horario

  @create_attrs %{
    hora_fim: "some hora_fim",
    hora_inicio: "some hora_inicio",
    n_voltas: 42,
    zootec: true
  }
  @update_attrs %{
    hora_fim: "some updated hora_fim",
    hora_inicio: "some updated hora_inicio",
    n_voltas: 43,
    zootec: false
  }
  @invalid_attrs %{hora_fim: nil, hora_inicio: nil, n_voltas: nil, zootec: nil}

  def fixture(:horario) do
    {:ok, horario} = Horarios.create_horario(@create_attrs)
    horario
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all horarios", %{conn: conn} do
      conn = get(conn, Routes.api_horario_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create horario" do
    test "renders horario when data is valid", %{conn: conn} do
      conn = post(conn, Routes.api_horario_path(conn, :create), horario: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.api_horario_path(conn, :show, id))

      assert %{
               "id" => id,
               "hora_fim" => "some hora_fim",
               "hora_inicio" => "some hora_inicio",
               "n_voltas" => 42,
               "zootec" => true
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.api_horario_path(conn, :create), horario: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update horario" do
    setup [:create_horario]

    test "renders horario when data is valid", %{conn: conn, horario: %Horario{id: id} = horario} do
      conn = put(conn, Routes.api_horario_path(conn, :update, horario), horario: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.api_horario_path(conn, :show, id))

      assert %{
               "id" => id,
               "hora_fim" => "some updated hora_fim",
               "hora_inicio" => "some updated hora_inicio",
               "n_voltas" => 43,
               "zootec" => false
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, horario: horario} do
      conn = put(conn, Routes.api_horario_path(conn, :update, horario), horario: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete horario" do
    setup [:create_horario]

    test "deletes chosen horario", %{conn: conn, horario: horario} do
      conn = delete(conn, Routes.api_horario_path(conn, :delete, horario))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.api_horario_path(conn, :show, horario))
      end
    end
  end

  defp create_horario(_) do
    horario = fixture(:horario)
    {:ok, horario: horario}
  end
end
