defmodule KittenGraphqlWeb.KittenControllerTest do
  use KittenGraphqlWeb.ConnCase

  alias KittenGraphql.Kittens

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:kitten) do
    {:ok, kitten} = Kittens.create_kitten(@create_attrs)
    kitten
  end

  describe "index" do
    test "lists all kittens", %{conn: conn} do
      conn = get(conn, Routes.kitten_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Kittens"
    end
  end

  describe "new kitten" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.kitten_path(conn, :new))
      assert html_response(conn, 200) =~ "New Kitten"
    end
  end

  describe "create kitten" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.kitten_path(conn, :create), kitten: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.kitten_path(conn, :show, id)

      conn = get(conn, Routes.kitten_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Kitten"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.kitten_path(conn, :create), kitten: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Kitten"
    end
  end

  describe "edit kitten" do
    setup [:create_kitten]

    test "renders form for editing chosen kitten", %{conn: conn, kitten: kitten} do
      conn = get(conn, Routes.kitten_path(conn, :edit, kitten))
      assert html_response(conn, 200) =~ "Edit Kitten"
    end
  end

  describe "update kitten" do
    setup [:create_kitten]

    test "redirects when data is valid", %{conn: conn, kitten: kitten} do
      conn = put(conn, Routes.kitten_path(conn, :update, kitten), kitten: @update_attrs)
      assert redirected_to(conn) == Routes.kitten_path(conn, :show, kitten)

      conn = get(conn, Routes.kitten_path(conn, :show, kitten))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, kitten: kitten} do
      conn = put(conn, Routes.kitten_path(conn, :update, kitten), kitten: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Kitten"
    end
  end

  describe "delete kitten" do
    setup [:create_kitten]

    test "deletes chosen kitten", %{conn: conn, kitten: kitten} do
      conn = delete(conn, Routes.kitten_path(conn, :delete, kitten))
      assert redirected_to(conn) == Routes.kitten_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.kitten_path(conn, :show, kitten))
      end
    end
  end

  defp create_kitten(_) do
    kitten = fixture(:kitten)
    {:ok, kitten: kitten}
  end
end
