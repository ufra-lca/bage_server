defmodule OndeServer.Repo.Migrations.AddItinerarioHorario do
  use Ecto.Migration

  def change do
    alter table(:horarios) do
      add :itinerario, :string

    end
  end
end
