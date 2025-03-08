defmodule LaranjaBankWeb.UsersController do
  use LaranjaBankWeb, :controller

  alias LaranjaBank.Users
  alias Users.User

  action_fallback LaranjaBankWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Users.create(params) do
      conn
      |> put_status(:created)
      |> render(:create, user: user)
    end
  end
end
