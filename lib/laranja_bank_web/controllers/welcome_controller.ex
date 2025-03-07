defmodule LaranjaBankWeb.WelcomeController do
  use LaranjaBankWeb, :controller

  def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> json(%{message: "Welcome to LaranjaBank API"})
  end
end
