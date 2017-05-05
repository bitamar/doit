defmodule Doit.SessionControllerTest do
  use Doit.ConnCase

  alias Doit.Session
  alias Doit.User

  @valid_attrs %{email: "mail@mail", raw_password: "apassword"}

  setup %{conn: conn} do
    changeset =  User.registration_changeset(%User{}, @valid_attrs)
    Repo.insert changeset
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, session_path(conn, :create), user: @valid_attrs
    assert token = json_response(conn, 201)["data"]["token"]
    assert Repo.get_by(Session, token: token)
  end

  test "does not create resource and renders errors when password is invalid", %{conn: conn} do
    conn = post conn, session_path(conn, :create), user: Map.put(@valid_attrs, :raw_password, "wrongpassword")
    assert json_response(conn, 401)["errors"] != %{}
  end

  test "does not create resource and renders errors when email is invalid", %{conn: conn} do
    conn = post conn, session_path(conn, :create), user: Map.put(@valid_attrs, :email, "wrong@email")
    assert json_response(conn, 401)["errors"] != %{}
  end

end
