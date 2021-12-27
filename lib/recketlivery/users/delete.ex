defmodule Recketlivery.Users.Delete do
  alias Recketlivery.{Repo, User, Error}

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_user_not_found_error()}
      user -> Repo.delete(user)
    end
  end
end
