defmodule Doit.UserTest do
  use Doit.ModelCase

  alias Doit.User

  @valid_attrs %{email: "mail@mail", name: "some content", raw_password: "some content"}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset, email too short" do
    changeset = User.changeset(
      %User{}, Map.put(@valid_attrs, :email, "")
    )
    refute changeset.valid?
  end

  test "changeset, email invalid format" do
    changeset = User.changeset(
      %User{}, Map.put(@valid_attrs, :email, "foo.com")
    )
    refute changeset.valid?
  end

  test "registration_changeset, with valid attributes" do
    changeset = User.registration_changeset(%User{}, @valid_attrs)
    assert changeset.changes.password
    assert changeset.valid?
  end

  test "registration_changeset, password too short" do
    changeset = User.registration_changeset(
      %User{}, Map.put(@valid_attrs, :raw_password, "12345")
    )
    refute changeset.valid?
  end
end
