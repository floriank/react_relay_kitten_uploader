defmodule KittenGrapqhl.Repo.Migrations.CreateKittens do
  use Ecto.Migration

  def change do
    create table(:kittens) do
      add :name, :string

      timestamps()
    end

  end
end
