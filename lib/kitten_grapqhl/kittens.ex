defmodule KittenGrapqhl.Kittens do
  @moduledoc """
  The Kittens context.
  """

  import Ecto.Query, warn: false
  alias KittenGrapqhl.Repo

  alias KittenGrapqhl.Kittens.Kitten

  @doc """
  Returns the list of kittens.

  ## Examples

      iex> list_kittens()
      [%Kitten{}, ...]

  """
  def list_kittens do
    Repo.all(Kitten)
  end

  @doc """
  Gets a single kitten.

  Raises `Ecto.NoResultsError` if the Kitten does not exist.

  ## Examples

      iex> get_kitten!(123)
      %Kitten{}

      iex> get_kitten!(456)
      ** (Ecto.NoResultsError)

  """
  def get_kitten!(id), do: Repo.get!(Kitten, id)

  @doc """
  Creates a kitten.

  ## Examples

      iex> create_kitten(%{field: value})
      {:ok, %Kitten{}}

      iex> create_kitten(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_kitten(attrs \\ %{}) do
    %Kitten{}
    |> Kitten.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a kitten.

  ## Examples

      iex> update_kitten(kitten, %{field: new_value})
      {:ok, %Kitten{}}

      iex> update_kitten(kitten, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_kitten(%Kitten{} = kitten, attrs) do
    kitten
    |> Kitten.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Kitten.

  ## Examples

      iex> delete_kitten(kitten)
      {:ok, %Kitten{}}

      iex> delete_kitten(kitten)
      {:error, %Ecto.Changeset{}}

  """
  def delete_kitten(%Kitten{} = kitten) do
    Repo.delete(kitten)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking kitten changes.

  ## Examples

      iex> change_kitten(kitten)
      %Ecto.Changeset{source: %Kitten{}}

  """
  def change_kitten(%Kitten{} = kitten) do
    Kitten.changeset(kitten, %{})
  end
end
