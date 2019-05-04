defmodule KittenGrapqhl.Kittens.Kitten do
  use Ecto.Schema
  import Ecto.Changeset

  schema "kittens" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(kitten, attrs) do
    kitten
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
