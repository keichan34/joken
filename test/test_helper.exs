ExUnit.start()

defmodule Joken.TestPoison do
  alias Poison, as: JSON
  use Joken.Parameters

  def encode(map) do
    JSON.encode!(map)
  end

  def decode(binary) do
    JSON.decode!(binary, keys: :atoms!)
  end
end

defmodule Joken.TestJsx do
  alias :jsx, as: JSON
  use Joken.Parameters

  def encode(map) do
    JSON.encode(map)
  end

  def decode(binary) do
    JSON.decode(binary)
    |> Enum.map(fn({key, value})-> {String.to_atom(key), value} end)
  end
end
