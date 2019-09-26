defmodule OndeServer.Horarios do
  @moduledoc """
  The Horarios context.
  """

  import Ecto.Query, warn: false
  alias OndeServer.Repo

  alias OndeServer.Horarios.Horario

  @doc """
  Returns the list of horarios.

  ## Examples

      iex> list_horarios()
      [%Horario{}, ...]

  """
  def list_horarios do
    Repo.all(Horario)
  end

  @doc """
  Gets a single horario.

  Raises `Ecto.NoResultsError` if the Horario does not exist.

  ## Examples

      iex> get_horario!(123)
      %Horario{}

      iex> get_horario!(456)
      ** (Ecto.NoResultsError)

  """
  def get_horario!(id), do: Repo.get!(Horario, id)

  @doc """
  Creates a horario.

  ## Examples

      iex> create_horario(%{field: value})
      {:ok, %Horario{}}

      iex> create_horario(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_horario(attrs \\ %{}) do
    %Horario{}
    |> Horario.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a horario.

  ## Examples

      iex> update_horario(horario, %{field: new_value})
      {:ok, %Horario{}}

      iex> update_horario(horario, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_horario(%Horario{} = horario, attrs) do
    horario
    |> Horario.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Horario.

  ## Examples

      iex> delete_horario(horario)
      {:ok, %Horario{}}

      iex> delete_horario(horario)
      {:error, %Ecto.Changeset{}}

  """
  def delete_horario(%Horario{} = horario) do
    Repo.delete(horario)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking horario changes.

  ## Examples

      iex> change_horario(horario)
      %Ecto.Changeset{source: %Horario{}}

  """
  def change_horario(%Horario{} = horario) do
    Horario.changeset(horario, %{})
  end
end
