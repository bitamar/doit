defmodule Doit.Session do
  use Doit.Web, :model

  schema "sessions" do
    field :token, :string
    belongs_to :user, Doit.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:user_id])
    |> validate_required([:user_id])
  end


  def create_changeset(model, params \\ :empty) do
    model
    |> changeset(params)
    |> put_change(:token, SecureRandom.urlsafe_base64())
  end
end
