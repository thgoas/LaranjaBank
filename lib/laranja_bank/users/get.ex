defmodule LaranjaBank.Users.Get do
  alias LaranjaBank.Users.User
  alias LaranjaBank.Repo

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end
end
