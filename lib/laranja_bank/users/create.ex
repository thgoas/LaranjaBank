defmodule LaranjaBank.Users.Create do
  alias LaranjaBank.Users.User
  alias LaranjaBank.Repo

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end

end
