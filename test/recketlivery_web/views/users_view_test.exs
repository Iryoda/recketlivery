defmodule RecketliveryWeb.UsersViewTest do
  use RecketliveryWeb.ConnCase, async: true

  import Phoenix.View
  import Recketlivery.Factory

  alias RecketliveryWeb.UsersView

  test "renders create.json" do
    user = build(:user)

    token = "xpto1234"

    response = render(UsersView, "create.json", token: token, user: user)

    expected_response = %{
      message: "User created",
      token: "xpto1234",
      user: %Recketlivery.User{
        address: "Rua das ruas",
        age: 20,
        cep: "12345678",
        cpf: "123456788901",
        email: "email@mail.com",
        id: "70282eaf-09e9-40ac-a4f1-f79ff1d3b75a",
        inserted_at: nil,
        name: "any_name",
        password: "123456",
        password_hash: nil,
        updated_at: nil
      }
    }

    assert expected_response == response
  end
end
