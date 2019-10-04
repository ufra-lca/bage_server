defmodule OndeServer.Horarios.Horario do
  use Ecto.Schema
  import Ecto.Changeset

  schema "horarios" do
    field :hora_fim, :string
    field :hora_inicio, :string
    field :n_voltas, :integer
    field :zootec, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(horario, attrs) do
    horario
    |> cast(attrs, [:hora_inicio, :hora_fim, :n_voltas, :zootec])
    |> validate_required([:hora_inicio, :hora_fim, :n_voltas, :zootec])
  end
end
