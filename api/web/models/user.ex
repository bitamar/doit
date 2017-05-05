defmodule Doit.User do
  use Doit.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string
    field :password, :string
    field :raw_password, :string, virtual: true

    timestamps()
  end

  def changeset(model, params \\ :empty) do
    model
     |> cast(params, [:name, :email])
     |> validate_required([:name, :email])
     |> validate_length(:email, min: 1, max: 255)
     |> validate_format(:email, ~r/@/)
   end

   def registration_changeset(model, params \\ :empty) do
     model
     |> changeset(params)
     |> cast(params, [:raw_password])
     |> validate_length(:raw_password, min: 6)
     |> put_password_hash
   end

   defp put_password_hash(changeset) do
     case changeset do
       %Ecto.Changeset{valid?: true, changes: %{raw_password: pass}} ->
         put_change(changeset, :password, Comeonin.Bcrypt.hashpwsalt(pass))
       _ ->
         changeset
     end
   end
end
