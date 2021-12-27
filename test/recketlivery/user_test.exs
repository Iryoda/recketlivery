defmodule Recketlivery.UserTest do
  use Recketlivery.DataCase, async: true

  import Recketlivery.Factory

  alias Ecto.Changeset
  alias Recketlivery.User

  describe "changeset/2" do
    test "when all params are valid, returns a valid changeset" do
      params = build(:user_params)

      response = User.changeset(params)

      assert %Changeset{changes: %{name: "any_name"}, valid?: true} = response
    end

    test "when a changest, returns a valid changeset with given changes" do
      params = build(:user_params)

      update_params = %{name: "any_name", password: "123456"}

      response =
        params
        |> User.changeset()
        |> User.changeset(update_params)

      assert %Changeset{changes: %{name: "any_name"}, valid?: true} = response
    end

    test "when there are some error, returns a invalid changeset" do
      params = build(:user_params, %{"age" => 15, "password" => "123"})

      response = User.changeset(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["should be at least 6 character(s)"]
      }

      assert errors_on(response) == expected_response
    end
  end
end
