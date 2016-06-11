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

  defp look_and_say(string) do
    make_result = fn(match, char) -> "#{String.length(match)}#{char}" end

    Regex.replace(~r/(.)\1*/, string, make_result)
  end
end
