defmodule LaranjaBank.Users do
  alias LaranjaBank.Users.Create
  defdelegate create(params), to: Create, as: :call
end
