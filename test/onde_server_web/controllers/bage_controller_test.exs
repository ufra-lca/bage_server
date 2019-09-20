defmodule OndeServerWeb.BageControllerTest do
  use OndeServerWeb.ConnCase

  alias OndeServer.GeoLocation
  alias OndeServer.GeoLocation.Bage

  @create_attrs %{
    latitude: "120.5",
    longitude: "120.5",
    one_signal: "some one_signal",
    rodando: true,
    sentido: true,
    zootec: true
  }
  @update_attrs %{
    latitude: "456.7",
    longitude: "456.7",
    one_signal: "some updated one_signal",
    rodando: false,
    sentido: false,
    zootec: false
  }
  @invalid_attrs %{latitude: nil, longitude: nil, one_signal: nil, rodando: nil, sentido: nil, zootec: nil}

  def fixture(:bage) do
    {:ok, bage} = GeoLocation.create_bage(@create_attrs)
    bage
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all bages", %{conn: conn} do
      conn = get(conn, Routes.bage_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create bage" do
    test "renders bage when data is valid", %{conn: conn} do
      conn = post(conn, Routes.bage_path(conn, :create), bage: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.bage_path(conn, :show, id))

      assert %{
               "id" => id,
               "latitude" => "120.5",
               "longitude" => "120.5",
               "one_signal" => "some one_signal",
               "rodando" => true,
               "sentido" => true,
               "zootec" => true
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.bage_path(conn, :create), bage: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update bage" do
    setup [:create_bage]

    test "renders bage when data is valid", %{conn: conn, bage: %Bage{id: id} = bage} do
      conn = put(conn, Routes.bage_path(conn, :update, bage), bage: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.bage_path(conn, :show, id))

      assert %{
               "id" => id,
               "latitude" => "456.7",
               "longitude" => "456.7",
               "one_signal" => "some updated one_signal",
               "rodando" => false,
               "sentido" => false,
               "zootec" => false
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, bage: bage} do
      conn = put(conn, Routes.bage_path(conn, :update, bage), bage: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete bage" do
    setup [:create_bage]

    test "deletes chosen bage", %{conn: conn, bage: bage} do
      conn = delete(conn, Routes.bage_path(conn, :delete, bage))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.bage_path(conn, :show, bage))
      end
    end
  end

  defp create_bage(_) do
    bage = fixture(:bage)
    {:ok, bage: bage}
  end
end
