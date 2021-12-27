defmodule RecketliveryWeb.UsersControllerTest do
  use RecketliveryWeb.ConnCase, async: true

  import Mox
  import Recketlivery.Factory

  alias Recketlivery.ViaCep.ClientMock
  alias RecketliveryWeb.Auth.Guardian

  describe "create/2" do
    test "when all params are valid, creates the user", %{conn: conn} do
      params = build(:user_params)

      expect(ClientMock, :get_cep_info, fn _cep ->
        {:ok, build(:cep_info)}
      end)

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "User created",
               "user" => %{
                 "address" => "Rua das ruas",
                 "age" => 20,
                 "cpf" => "123456788901",
                 "email" => "email@mail.com",
                 "id" => __id
               }
             } = response
    end

    test "when there is some error, returns the error", %{conn: conn} do
      params = %{"password" => "123456", "name" => Rafael}

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{
        "message" => %{
          "address" => ["can't be blank"],
          "age" => ["can't be blank"],
          "cep" => ["can't be blank"],
          "cpf" => ["can't be blank"],
          "email" => ["can't be blank"]
        }
      }

      assert expected_response == response
    end
  end

  describe "delete/2" do
    setup %{conn: conn} do
      user = insert(:user)
      {:ok, token, _claims} = Guardian.encode_and_sign(user)
      conn = put_req_header(conn, "authorization", "Bearer #{token}")

      {:ok, conn: conn, user: user}
    end

    test "when there is a use with the given id, deletes the user", %{conn: conn} do
      id = "70282eaf-09e9-40ac-a4f1-f79ff1d3b75a"

      response =
        conn
        |> delete(Routes.users_path(conn, :delete, id))
        |> response(:no_content)

      assert response == ""
    end
  end
end
