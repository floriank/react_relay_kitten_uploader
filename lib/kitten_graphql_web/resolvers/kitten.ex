defmodule KittenGraphqlWeb.Resolvers.Kitten do
  def create_kitten(_parent, %{name: name, image: _} = _inputs, _ctx) do
    # the :image variable here is a plug upload, you can use arc to attach it
    # or just straight away use it.
    {:ok, kitten} = KittenGraphql.Kittens.create_kitten(%{name: name})

    {:ok, %{kitten: kitten}}
  end
end
