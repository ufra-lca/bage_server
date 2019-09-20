defmodule OndeServer.GeoLocationTest do
  use OndeServer.DataCase

  alias OndeServer.GeoLocation

  describe "bages" do
    alias OndeServer.GeoLocation.Bage

    @valid_attrs %{latitude: "120.5", longitude: "120.5", one_signal: "some one_signal", rodando: true, sentido: true, zootec: true}
    @update_attrs %{latitude: "456.7", longitude: "456.7", one_signal: "some updated one_signal", rodando: false, sentido: false, zootec: false}
    @invalid_attrs %{latitude: nil, longitude: nil, one_signal: nil, rodando: nil, sentido: nil, zootec: nil}

    def bage_fixture(attrs \\ %{}) do
      {:ok, bage} =
        attrs
        |> Enum.into(@valid_attrs)
        |> GeoLocation.create_bage()

      bage
    end

    test "list_bages/0 returns all bages" do
      bage = bage_fixture()
      assert GeoLocation.list_bages() == [bage]
    end

    test "get_bage!/1 returns the bage with given id" do
      bage = bage_fixture()
      assert GeoLocation.get_bage!(bage.id) == bage
    end

    test "create_bage/1 with valid data creates a bage" do
      assert {:ok, %Bage{} = bage} = GeoLocation.create_bage(@valid_attrs)
      assert bage.latitude == Decimal.new("120.5")
      assert bage.longitude == Decimal.new("120.5")
      assert bage.one_signal == "some one_signal"
      assert bage.rodando == true
      assert bage.sentido == true
      assert bage.zootec == true
    end

    test "create_bage/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = GeoLocation.create_bage(@invalid_attrs)
    end

    test "update_bage/2 with valid data updates the bage" do
      bage = bage_fixture()
      assert {:ok, %Bage{} = bage} = GeoLocation.update_bage(bage, @update_attrs)
      assert bage.latitude == Decimal.new("456.7")
      assert bage.longitude == Decimal.new("456.7")
      assert bage.one_signal == "some updated one_signal"
      assert bage.rodando == false
      assert bage.sentido == false
      assert bage.zootec == false
    end

    test "update_bage/2 with invalid data returns error changeset" do
      bage = bage_fixture()
      assert {:error, %Ecto.Changeset{}} = GeoLocation.update_bage(bage, @invalid_attrs)
      assert bage == GeoLocation.get_bage!(bage.id)
    end

    test "delete_bage/1 deletes the bage" do
      bage = bage_fixture()
      assert {:ok, %Bage{}} = GeoLocation.delete_bage(bage)
      assert_raise Ecto.NoResultsError, fn -> GeoLocation.get_bage!(bage.id) end
    end

    test "change_bage/1 returns a bage changeset" do
      bage = bage_fixture()
      assert %Ecto.Changeset{} = GeoLocation.change_bage(bage)
    end
  end
end
