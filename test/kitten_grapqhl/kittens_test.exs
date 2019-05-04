defmodule KittenGrapqhl.KittensTest do
  use KittenGrapqhl.DataCase

  alias KittenGrapqhl.Kittens

  describe "kittens" do
    alias KittenGrapqhl.Kittens.Kitten

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def kitten_fixture(attrs \\ %{}) do
      {:ok, kitten} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Kittens.create_kitten()

      kitten
    end

    test "list_kittens/0 returns all kittens" do
      kitten = kitten_fixture()
      assert Kittens.list_kittens() == [kitten]
    end

    test "get_kitten!/1 returns the kitten with given id" do
      kitten = kitten_fixture()
      assert Kittens.get_kitten!(kitten.id) == kitten
    end

    test "create_kitten/1 with valid data creates a kitten" do
      assert {:ok, %Kitten{} = kitten} = Kittens.create_kitten(@valid_attrs)
      assert kitten.name == "some name"
    end

    test "create_kitten/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Kittens.create_kitten(@invalid_attrs)
    end

    test "update_kitten/2 with valid data updates the kitten" do
      kitten = kitten_fixture()
      assert {:ok, %Kitten{} = kitten} = Kittens.update_kitten(kitten, @update_attrs)
      assert kitten.name == "some updated name"
    end

    test "update_kitten/2 with invalid data returns error changeset" do
      kitten = kitten_fixture()
      assert {:error, %Ecto.Changeset{}} = Kittens.update_kitten(kitten, @invalid_attrs)
      assert kitten == Kittens.get_kitten!(kitten.id)
    end

    test "delete_kitten/1 deletes the kitten" do
      kitten = kitten_fixture()
      assert {:ok, %Kitten{}} = Kittens.delete_kitten(kitten)
      assert_raise Ecto.NoResultsError, fn -> Kittens.get_kitten!(kitten.id) end
    end

    test "change_kitten/1 returns a kitten changeset" do
      kitten = kitten_fixture()
      assert %Ecto.Changeset{} = Kittens.change_kitten(kitten)
    end
  end
end
