defmodule LaranjaBank.Users.Update do
  alias LaranjaBank.Users.User
  alias LaranjaBank.Repo

  def call(%{"id" => id} = params) do
    IO.inspect(params)

    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      user -> update(user, params)
    end
  end

  defp update(user, params) do
    user
    |> User.changeset(params)
    |> Repo.update()
  end
end
