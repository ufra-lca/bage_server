defmodule OndeServer.Repo.Migrations.CreateBages do
  use Ecto.Migration

  def change do
    create table(:bages) do
      add :latitude, :decimal
      add :longitude, :decimal
      add :zootec, :boolean, default: false, null: false
      add :rodando, :boolean, default: false, null: false
      add :sentido, :boolean, default: false, null: false
      add :one_signal, :string

      timestamps()
    end

  end
end
