defmodule LaranjaBank.Users do
  alias LaranjaBank.Users.Create
  alias LaranjaBank.Users.Get
  defdelegate create(params), to: Create, as: :call
  defdelegate get(id), to: Get, as: :call
end
