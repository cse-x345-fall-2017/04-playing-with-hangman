defmodule Dictionary do

  defdelegate start_link(),           to: Dictionary.Impl
  defdelegate random_word(),          to: Dictionary.Impl

end
