defmodule KittenGrapqhlWeb.KittenController do
  use KittenGrapqhlWeb, :controller

  alias KittenGrapqhl.Kittens
  alias KittenGrapqhl.Kittens.Kitten

  def index(conn, _params) do
    kittens = Kittens.list_kittens()
    render(conn, "index.html", kittens: kittens)
  end

  def new(conn, _params) do
    changeset = Kittens.change_kitten(%Kitten{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"kitten" => kitten_params}) do
    case Kittens.create_kitten(kitten_params) do
      {:ok, kitten} ->
        conn
        |> put_flash(:info, "Kitten created successfully.")
        |> redirect(to: Routes.kitten_path(conn, :show, kitten))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    kitten = Kittens.get_kitten!(id)
    render(conn, "show.html", kitten: kitten)
  end

  def edit(conn, %{"id" => id}) do
    kitten = Kittens.get_kitten!(id)
    changeset = Kittens.change_kitten(kitten)
    render(conn, "edit.html", kitten: kitten, changeset: changeset)
  end

  def update(conn, %{"id" => id, "kitten" => kitten_params}) do
    kitten = Kittens.get_kitten!(id)

    case Kittens.update_kitten(kitten, kitten_params) do
      {:ok, kitten} ->
        conn
        |> put_flash(:info, "Kitten updated successfully.")
        |> redirect(to: Routes.kitten_path(conn, :show, kitten))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", kitten: kitten, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    kitten = Kittens.get_kitten!(id)
    {:ok, _kitten} = Kittens.delete_kitten(kitten)

    conn
    |> put_flash(:info, "Kitten deleted successfully.")
    |> redirect(to: Routes.kitten_path(conn, :index))
  end
end
