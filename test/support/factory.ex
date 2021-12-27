defmodule Recketlivery.Factory do
  use ExMachina.Ecto, repo: Recketlivery.Repo

  alias Recketlivery.User

  def user_params_factory do
    %{
      "age" => 20,
      "address" => "Rua das ruas",
      "cep" => "12345678",
      "cpf" => "123456788901",
      "email" => "email@mail.com",
      "password" => "123456",
      "name" => "any_name"
    }
  end

  def user_factory do
    %User{
      age: 20,
      address: "Rua das ruas",
      cep: "12345678",
      cpf: "123456788901",
      email: "email@mail.com",
      password: "123456",
      name: "any_name",
      id: "70282eaf-09e9-40ac-a4f1-f79ff1d3b75a"
    }
  end

  def cep_info_factory do
    %{
      "bairro" => "Sé",
      "cep" => "01001-000",
      "complemento" => "lado ímpar",
      "ddd" => "11",
      "gia" => "1004",
      "ibge" => "3550308",
      "localidade" => "São Paulo",
      "logradouro" => "Praça da Sé",
      "siafi" => "7107",
      "uf" => "SP"
    }
  end
end
