defmodule Doit.TaskView do
  use Doit.Web, :view

  def render("index.json", %{tasks: tasks}) do
    %{data: render_many(tasks, Doit.TaskView, "task.json")}
  end

  def render("show.json", %{task: task}) do
    %{data: render_one(task, Doit.TaskView, "task.json")}
  end

  def render("task.json", %{task: task}) do
    %{id: task.id,
      title: task.title,
      description: task.description,
      due_date: task.due_date,
      completed: task.completed,
      user_id: task.user_id}
  end
end
