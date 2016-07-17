defmodule LookAndSay do
  def main([string, n]) do
    string
    |> look_and_say_n_times(String.to_integer(n))
    |> String.length
    |> IO.puts
  end

  defp look_and_say_n_times(string, n) do
    string
    |> Stream.iterate(&look_and_say/1)
    |> Stream.drop(n)
    |> Enum.take(1)
    |> List.first
  end

  @doc """
  Perform the look and say transformation on a string.  For example `1233` is
  one one, one two, two threes, so it becomes `111223`

      iex> LookAndSay.look_and_say("1233")
      "111223"
  """
  def look_and_say(string) do
    string |> String.to_char_list |> look_and_say([])
  end
  defp look_and_say([], acc) do
    acc
    |> Enum.reverse
    |> Enum.map(fn({n, char}) -> "#{n}#{[char]}" end)
    |> Enum.join
  end
  defp look_and_say([h | t], [{n, h} | acc_t]), do: look_and_say(t, [{n + 1, h} | acc_t])
  defp look_and_say([h | t], acc), do: look_and_say(t, [{1, h} | acc])
end
