defmodule DatatablexWeb.ZipControllerTest do
  use DatatablexWeb.ConnCase

  alias Datatablex.Configurations

  @create_attrs %{city: "some city", state: "some state", zip_code: "some zip_code"}
  @update_attrs %{city: "some updated city", state: "some updated state", zip_code: "some updated zip_code"}
  @invalid_attrs %{city: nil, state: nil, zip_code: nil}

  def fixture(:zip) do
    {:ok, zip} = Configurations.create_zip(@create_attrs)
    zip
  end

  describe "index" do
    test "lists all zips", %{conn: conn} do
      conn = get(conn, Routes.zip_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Zips"
    end
  end

  describe "new zip" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.zip_path(conn, :new))
      assert html_response(conn, 200) =~ "New Zip"
    end
  end

  describe "create zip" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.zip_path(conn, :create), zip: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.zip_path(conn, :show, id)

      conn = get(conn, Routes.zip_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Zip"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.zip_path(conn, :create), zip: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Zip"
    end
  end

  describe "edit zip" do
    setup [:create_zip]

    test "renders form for editing chosen zip", %{conn: conn, zip: zip} do
      conn = get(conn, Routes.zip_path(conn, :edit, zip))
      assert html_response(conn, 200) =~ "Edit Zip"
    end
  end

  describe "update zip" do
    setup [:create_zip]

    test "redirects when data is valid", %{conn: conn, zip: zip} do
      conn = put(conn, Routes.zip_path(conn, :update, zip), zip: @update_attrs)
      assert redirected_to(conn) == Routes.zip_path(conn, :show, zip)

      conn = get(conn, Routes.zip_path(conn, :show, zip))
      assert html_response(conn, 200) =~ "some updated city"
    end

    test "renders errors when data is invalid", %{conn: conn, zip: zip} do
      conn = put(conn, Routes.zip_path(conn, :update, zip), zip: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Zip"
    end
  end

  describe "delete zip" do
    setup [:create_zip]

    test "deletes chosen zip", %{conn: conn, zip: zip} do
      conn = delete(conn, Routes.zip_path(conn, :delete, zip))
      assert redirected_to(conn) == Routes.zip_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.zip_path(conn, :show, zip))
      end
    end
  end

  defp create_zip(_) do
    zip = fixture(:zip)
    %{zip: zip}
  end
end
