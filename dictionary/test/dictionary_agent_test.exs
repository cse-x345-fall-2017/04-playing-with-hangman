defmodule DictionaryAgentTest do
  use ExUnit.Case, async: false
  alias  Dictionary.DictionaryImpl, as: DictionaryAgent


  setup do
    DictionaryAgent.start_link()
    :ok
  end

  test "agent returns random string." do
    assert 0 != String.length(DictionaryAgent.random_word())
  end

end
