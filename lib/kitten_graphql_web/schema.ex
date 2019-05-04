defmodule KittenGrapqhlWeb.Schema do
  use Absinthe.Schema
  use Absinthe.Relay.Schema, :modern

  # Important: This is imported to get the :upload type
  import_types(Absinthe.Plug.Types)

  node object(:kitten) do
    field :name, :string
  end

  node interface do
    resolve_type(fn
      _, _ ->
        :kitten
    end)
  end

  query do
    @desc "Get many kittens"
    field :kittens, list_of(:kitten)
  end

  mutation do
    @desc "Create a new kitten, awww *_*"
    payload field :new_kitten do
      @desc "Input for a new kitten"
      input do
        @desc "The photo of the kitten"
        field(:card_image, non_null(:upload))

        @desc "The name of the kitten"
        field(:name, non_null(:string))
      end

      output do
        @desc "The newly created kitten"
        field :kitten, :kitten
      end

      resolve(&Resolvers.Kitten.create_kitten/3)
    end
  end
end
