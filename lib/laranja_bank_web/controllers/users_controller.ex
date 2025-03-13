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

  def show(conn,%{"id" => id}) do
    with {:ok, %User{} = user} <- Users.get(id) do
      conn
      |> put_status(:ok)
      |> render(:get, user: user)
    end
  end
end
