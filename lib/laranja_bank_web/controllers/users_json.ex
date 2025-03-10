defmodule LaranjaBankWeb.UsersJSON do
  alias LaranjaBank.Users.User
  def create(%{user: user}) do
    %{
      message: "User created",
      data: data(user)
    }
  end

  defp data(%User{} = user) do
    %{
      id: user.id,
      name: user.name,
      email: user.email,
      cep: user.cep,
    }
  end
end
