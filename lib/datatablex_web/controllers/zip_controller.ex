defmodule DatatablexWeb.ZipController do
  use DatatablexWeb, :controller

  alias Datatablex.Configurations
  alias Datatablex.Configurations.Zip

  def index(conn, _params) do
    zips = Configurations.list_zips()
    render(conn, "index.html", zips: zips)
  end

  def new(conn, _params) do
    changeset = Configurations.change_zip(%Zip{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"zip" => zip_params}) do
    case Configurations.create_zip(zip_params) do
      {:ok, zip} ->
        conn
        |> put_flash(:info, "Zip created successfully.")
        |> redirect(to: Routes.zip_path(conn, :show, zip))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    zip = Configurations.get_zip!(id)
    render(conn, "show.html", zip: zip)
  end

  def edit(conn, %{"id" => id}) do
    zip = Configurations.get_zip!(id)
    changeset = Configurations.change_zip(zip)
    render(conn, "edit.html", zip: zip, changeset: changeset)
  end

  def update(conn, %{"id" => id, "zip" => zip_params}) do
    zip = Configurations.get_zip!(id)

    case Configurations.update_zip(zip, zip_params) do
      {:ok, zip} ->
        conn
        |> put_flash(:info, "Zip updated successfully.")
        |> redirect(to: Routes.zip_path(conn, :show, zip))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", zip: zip, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    zip = Configurations.get_zip!(id)
    {:ok, _zip} = Configurations.delete_zip(zip)

    conn
    |> put_flash(:info, "Zip deleted successfully.")
    |> redirect(to: Routes.zip_path(conn, :index))
  end
end
