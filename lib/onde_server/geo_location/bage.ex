defmodule OndeServer.GeoLocation.Bage do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bages" do
    field :latitude, :decimal
    field :longitude, :decimal
    field :one_signal, :string
    field :rodando, :boolean, default: false
    field :sentido, :boolean, default: false
    field :zootec, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(bage, attrs) do
    bage
    |> cast(attrs, [:latitude, :longitude, :zootec, :rodando, :sentido, :one_signal])
    |> validate_required([:latitude, :longitude, :zootec, :rodando, :sentido, :one_signal])
  end
end
