defmodule LaranjaBankWeb.FallbackController do
  use LaranjaBankWeb, :controller

  def call(conn, {:error, changeset}) do
    conn
    |> put_status(:bad_request)
    |> put_view(json: LaranjaBankWeb.ErrorJSON)
    |> render(:error, changeset: changeset)
  end
end
