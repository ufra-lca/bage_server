defmodule OndeServer.HorariosTest do
  use OndeServer.DataCase

  alias OndeServer.Horarios

  describe "horarios" do
    alias OndeServer.Horarios.Horario

    @valid_attrs %{hora_fim: "some hora_fim", hora_inicio: "some hora_inicio", n_voltas: 42, zootec: true}
    @update_attrs %{hora_fim: "some updated hora_fim", hora_inicio: "some updated hora_inicio", n_voltas: 43, zootec: false}
    @invalid_attrs %{hora_fim: nil, hora_inicio: nil, n_voltas: nil, zootec: nil}

    def horario_fixture(attrs \\ %{}) do
      {:ok, horario} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Horarios.create_horario()

      horario
    end

    test "list_horarios/0 returns all horarios" do
      horario = horario_fixture()
      assert Horarios.list_horarios() == [horario]
    end

    test "get_horario!/1 returns the horario with given id" do
      horario = horario_fixture()
      assert Horarios.get_horario!(horario.id) == horario
    end

    test "create_horario/1 with valid data creates a horario" do
      assert {:ok, %Horario{} = horario} = Horarios.create_horario(@valid_attrs)
      assert horario.hora_fim == "some hora_fim"
      assert horario.hora_inicio == "some hora_inicio"
      assert horario.n_voltas == 42
      assert horario.zootec == true
    end

    test "create_horario/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Horarios.create_horario(@invalid_attrs)
    end

    test "update_horario/2 with valid data updates the horario" do
      horario = horario_fixture()
      assert {:ok, %Horario{} = horario} = Horarios.update_horario(horario, @update_attrs)
      assert horario.hora_fim == "some updated hora_fim"
      assert horario.hora_inicio == "some updated hora_inicio"
      assert horario.n_voltas == 43
      assert horario.zootec == false
    end

    test "update_horario/2 with invalid data returns error changeset" do
      horario = horario_fixture()
      assert {:error, %Ecto.Changeset{}} = Horarios.update_horario(horario, @invalid_attrs)
      assert horario == Horarios.get_horario!(horario.id)
    end

    test "delete_horario/1 deletes the horario" do
      horario = horario_fixture()
      assert {:ok, %Horario{}} = Horarios.delete_horario(horario)
      assert_raise Ecto.NoResultsError, fn -> Horarios.get_horario!(horario.id) end
    end

    test "change_horario/1 returns a horario changeset" do
      horario = horario_fixture()
      assert %Ecto.Changeset{} = Horarios.change_horario(horario)
    end
  end
end
