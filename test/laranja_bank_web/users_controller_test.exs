defmodule LaranjaBankWeb.UsersControllerTest do
  use LaranjaBankWeb.ConnCase
  alias LaranjaBank.Users.User
  describe "create/2" do
    test "successfully creates a user", %{conn: conn} do
      params = %{
        "name" => "Teste",
        "email" => "teste@teste.com",
        "password" => "12345678",
        "cep" => "12345678"
      }

      response =
        conn
        |> post(~p"/api/users", params)
        |> json_response(:created)

      assert %{
               "data" => %{
                 "cep" => "12345678",
                 "email" => "teste@teste.com",
                 "id" => _id,
                 "name" => "Teste"
               },
               "message" => "User created"
             } = response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      params = %{
        "name" => "Tes",
        "email" => "teste.teste.com",
        "password" => "1",
        "cep" => "12"
      }

      response =
        conn
        |> post(~p"/api/users", params)
        |> json_response(:bad_request)

      expected_response = %{
        "erros" => %{
          "cep" => ["should be 8 character(s)"],
          "email" => ["has invalid format"],
          "name" => ["should be at least 4 character(s)"],
          "password" => ["should be at least 8 character(s)"]
        }
      }

      assert expected_response == response
    end
  end

  describe "update/2" do
    test "successfully delete an user", %{conn: conn} do
      params = %{
        "name" => "Teste",
        "email" => "teste@teste.com",
        "password" => "12345678",
        "cep" => "12345678"
      }

      {:ok, %User{id: id}}= LaranjaBank.Users.create(params)

      response =
        conn
        |> delete(~p"/api/users/#{id}")
        |> json_response(:ok)

      expected_response = %{
        "data" => %{
          "cep" => "12345678",
          "email" => "teste@teste.com",
          "id" => id,
          "name" => "Teste"
        },
        "message" => "User deleted"
      }

      assert expected_response == response
    end

  end
end
