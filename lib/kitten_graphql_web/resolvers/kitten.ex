defmodule KittenGraphqlWeb.Resolvers.Kitten do
  def create_kitten(_parent, %{name: name} = inputs, _ctx) do
    inputs |> IO.inspect()
    {:ok, kitten} = KittenGraphql.Kittens.create_kitten(%{name: name})

    {:ok, %{kitten: kitten}}
  end
end
