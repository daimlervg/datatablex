defmodule Datatablex.ConfigurationsTest do
  use Datatablex.DataCase

  alias Datatablex.Configurations

  describe "zips" do
    alias Datatablex.Configurations.Zip

    @valid_attrs %{city: "some city", state: "some state", zip_code: "some zip_code"}
    @update_attrs %{city: "some updated city", state: "some updated state", zip_code: "some updated zip_code"}
    @invalid_attrs %{city: nil, state: nil, zip_code: nil}

    def zip_fixture(attrs \\ %{}) do
      {:ok, zip} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Configurations.create_zip()

      zip
    end

    test "list_zips/0 returns all zips" do
      zip = zip_fixture()
      assert Configurations.list_zips() == [zip]
    end

    test "get_zip!/1 returns the zip with given id" do
      zip = zip_fixture()
      assert Configurations.get_zip!(zip.id) == zip
    end

    test "create_zip/1 with valid data creates a zip" do
      assert {:ok, %Zip{} = zip} = Configurations.create_zip(@valid_attrs)
      assert zip.city == "some city"
      assert zip.state == "some state"
      assert zip.zip_code == "some zip_code"
    end

    test "create_zip/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Configurations.create_zip(@invalid_attrs)
    end

    test "update_zip/2 with valid data updates the zip" do
      zip = zip_fixture()
      assert {:ok, %Zip{} = zip} = Configurations.update_zip(zip, @update_attrs)
      assert zip.city == "some updated city"
      assert zip.state == "some updated state"
      assert zip.zip_code == "some updated zip_code"
    end

    test "update_zip/2 with invalid data returns error changeset" do
      zip = zip_fixture()
      assert {:error, %Ecto.Changeset{}} = Configurations.update_zip(zip, @invalid_attrs)
      assert zip == Configurations.get_zip!(zip.id)
    end

    test "delete_zip/1 deletes the zip" do
      zip = zip_fixture()
      assert {:ok, %Zip{}} = Configurations.delete_zip(zip)
      assert_raise Ecto.NoResultsError, fn -> Configurations.get_zip!(zip.id) end
    end

    test "change_zip/1 returns a zip changeset" do
      zip = zip_fixture()
      assert %Ecto.Changeset{} = Configurations.change_zip(zip)
    end
  end
end
