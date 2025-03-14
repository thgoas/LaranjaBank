defmodule LaranjaBank.Users do
  alias LaranjaBank.Users.Create
  alias LaranjaBank.Users.Get
  alias LaranjaBank.Users.Update
  alias LaranjaBank.Users.Delete
  defdelegate create(params), to: Create, as: :call
  defdelegate get(id), to: Get, as: :call
  defdelegate update(params), to: Update, as: :call
  defdelegate delete(id), to: Delete, as: :call
end
