defmodule LaranjaBank.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @required_params [:name, :email, :password, :cep]

  schema "users" do
    field :name, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :cep, :string

    timestamps()
  end

  def changeset(user \\ %__MODULE__{}, params) do
    user
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:name, min: 4)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:cep, is: 8)
    |> validate_length(:password, min: 8)
    |> add_password_hash()
  end

  defp add_password_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    changes = %{password_hash: Argon2.hash_pwd_salt(password)}
    change(changeset, changes)
  end

  defp add_password_hash(changeset), do: changeset
end
