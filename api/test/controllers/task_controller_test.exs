defmodule Doit.TaskControllerTest do
  use Doit.ConnCase

  alias Doit.Task
  alias Doit.User
  alias Doit.Session

  setup %{conn: conn} do
    user = create_user(%{name: "jane"})
    session = create_session(user)

    conn = conn
    |> put_req_header("accept", "application/json")
    |> put_req_header("authorization", "Token token=\"#{session.token}\"")
    {:ok, conn: conn, current_user: user }
  end

  def create_user(%{name: name}) do
    User.changeset(%User{}, %{name: name, email: "#{name}@example.com"}) |> Repo.insert!
  end

  def create_session(user) do
    # in the last blog post I had a copy-paste error
    # so you may need to use Session.registration_changeset
    Session.create_changeset(%Session{user_id: user.id}, %{}) |> Repo.insert!
  end

  def create_task(%{user_id: _user_id, title: _title, description: _description, due_date: _due_date} = options) do
    Task.changeset(%Task{}, options) |> Repo.insert!
  end

  test "lists all entries on index", %{conn: conn, current_user: current_user} do
    create_task(%{user_id: current_user.id, title: "our first task", description: "..", due_date: %{day: 17, month: 4, year: 2017}})

    another_user = create_user(%{name: "johndoe"})
    create_task(%{user_id: another_user.id, title: "thier first task", description: "..", due_date: %{day: 17, month: 4, year: 2017}})

    conn = get conn, task_path(conn, :index)

    assert Enum.count(json_response(conn, 200)["data"]) == 1
    assert %{"title" => "our first task"} = hd(json_response(conn, 200)["data"])
  end

  test "creates and renders resource when data is valid", %{conn: conn, current_user: current_user} do
    task_ = %{completed: true, description: "some content", due_date: %{day: 17, month: 4, year: 2010}, title: "some content", user_id: current_user.id}
    conn = post conn, task_path(conn, :create), task: task_
    assert json_response(conn, 201)["data"]["id"]
    task = Repo.get_by(Task, task_)
    assert task
    assert task.user_id == current_user.id
  end
end
