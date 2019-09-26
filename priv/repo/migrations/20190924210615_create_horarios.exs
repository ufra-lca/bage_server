defmodule OndeServer.Repo.Migrations.CreateHorarios do
  use Ecto.Migration

  def change do
    create table(:horarios) do
      add :hora_inicio, :string
      add :hora_fim, :string
      add :n_voltas, :integer
      add :zootec, :boolean, default: false, null: false

      timestamps()
    end

  end
end
