defmodule Doit.TaskTest do
  use Doit.ModelCase

  alias Doit.Task

  @valid_attrs %{completed: true, description: "some content", due_date: %{day: 17, month: 4, year: 2010}, title: "some content", user_id: 1}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Task.changeset(%Task{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Task.changeset(%Task{}, @invalid_attrs)
    refute changeset.valid?
  end
end
