defmodule Doit.Task do
  use Doit.Web, :model

  schema "tasks" do
    field :title, :string
    field :description, :string
    field :due_date, Ecto.Date
    field :completed, :boolean, default: false
    belongs_to :user, Doit.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :description, :due_date, :completed])
    |> validate_required([:title, :description, :due_date, :completed])
  end
end
