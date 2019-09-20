defmodule OndeServer.GeoLocation do
  @moduledoc """
  The GeoLocation context.
  """

  import Ecto.Query, warn: false
  alias OndeServer.Repo

  alias OndeServer.GeoLocation.Bage

  @doc """
  Returns the list of bages.

  ## Examples

      iex> list_bages()
      [%Bage{}, ...]

  """
  def list_bages do
    Repo.all(Bage)
  end

  @doc """
  Gets a single bage.

  Raises `Ecto.NoResultsError` if the Bage does not exist.

  ## Examples

      iex> get_bage!(123)
      %Bage{}

      iex> get_bage!(456)
      ** (Ecto.NoResultsError)

  """
  def get_bage!(id), do: Repo.get!(Bage, id)

  def get_bage_by_one_signal(one_signal), do: Repo.get_by(Bage, one_signal: one_signal)

  @doc """
  Creates a bage.

  ## Examples

      iex> create_bage(%{field: value})
      {:ok, %Bage{}}

      iex> create_bage(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_bage(attrs \\ %{}) do
    %Bage{}
    |> Bage.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a bage.

  ## Examples

      iex> update_bage(bage, %{field: new_value})
      {:ok, %Bage{}}

      iex> update_bage(bage, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_bage(%Bage{} = bage, attrs) do
    bage
    |> Bage.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Bage.

  ## Examples

      iex> delete_bage(bage)
      {:ok, %Bage{}}

      iex> delete_bage(bage)
      {:error, %Ecto.Changeset{}}

  """
  def delete_bage(%Bage{} = bage) do
    Repo.delete(bage)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking bage changes.

  ## Examples

      iex> change_bage(bage)
      %Ecto.Changeset{source: %Bage{}}

  """
  def change_bage(%Bage{} = bage) do
    Bage.changeset(bage, %{})
  end
end
