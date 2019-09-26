defmodule OndeServerWeb.HorarioControllerTest do
  use OndeServerWeb.ConnCase

  alias OndeServer.Horarios

  @create_attrs %{hora_fim: "some hora_fim", hora_inicio: "some hora_inicio", n_voltas: 42, zootec: true}
  @update_attrs %{hora_fim: "some updated hora_fim", hora_inicio: "some updated hora_inicio", n_voltas: 43, zootec: false}
  @invalid_attrs %{hora_fim: nil, hora_inicio: nil, n_voltas: nil, zootec: nil}

  def fixture(:horario) do
    {:ok, horario} = Horarios.create_horario(@create_attrs)
    horario
  end

  describe "index" do
    test "lists all horarios", %{conn: conn} do
      conn = get(conn, Routes.horario_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Horarios"
    end
  end

  describe "new horario" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.horario_path(conn, :new))
      assert html_response(conn, 200) =~ "New Horario"
    end
  end

  describe "create horario" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.horario_path(conn, :create), horario: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.horario_path(conn, :show, id)

      conn = get(conn, Routes.horario_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Horario"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.horario_path(conn, :create), horario: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Horario"
    end
  end

  describe "edit horario" do
    setup [:create_horario]

    test "renders form for editing chosen horario", %{conn: conn, horario: horario} do
      conn = get(conn, Routes.horario_path(conn, :edit, horario))
      assert html_response(conn, 200) =~ "Edit Horario"
    end
  end

  describe "update horario" do
    setup [:create_horario]

    test "redirects when data is valid", %{conn: conn, horario: horario} do
      conn = put(conn, Routes.horario_path(conn, :update, horario), horario: @update_attrs)
      assert redirected_to(conn) == Routes.horario_path(conn, :show, horario)

      conn = get(conn, Routes.horario_path(conn, :show, horario))
      assert html_response(conn, 200) =~ "some updated hora_fim"
    end

    test "renders errors when data is invalid", %{conn: conn, horario: horario} do
      conn = put(conn, Routes.horario_path(conn, :update, horario), horario: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Horario"
    end
  end

  describe "delete horario" do
    setup [:create_horario]

    test "deletes chosen horario", %{conn: conn, horario: horario} do
      conn = delete(conn, Routes.horario_path(conn, :delete, horario))
      assert redirected_to(conn) == Routes.horario_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.horario_path(conn, :show, horario))
      end
    end
  end

  defp create_horario(_) do
    horario = fixture(:horario)
    {:ok, horario: horario}
  end
end
