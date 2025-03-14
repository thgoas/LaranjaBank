defmodule LaranjaBankWeb.UsersJSON do
  alias LaranjaBank.Users.User
  def create(%{user: user}) do
    %{
      message: "User created",
      data: data(user)
    }
  end

  def get(%{user: user}), do: %{data: user}
  def update(%{user: user}), do: %{message: "User updated", data: user}
  def delete(%{user: user}), do: %{message: "User deleted", data: user}
  defp data(%User{} = user) do
    %{
      id: user.id,
      name: user.name,
      email: user.email,
      cep: user.cep,
    }
  end
end
