defmodule Example do
  @moduledoc """
  Sample code for first section of the presentation.  The docs are in
  `markdown` so we can do simple formatting.
  """

  # Example.func/1
  def func(arg), do: func(arg, 0)

  # Example.func/2
  def func(arg, n) do
    IO.puts("Called with #{arg} and #{n}")
  end

  @doc """
  Calculate the factorial of a number.

      iex> Example.fact(10)
      3628800
  """
  @spec fact(non_neg_integer) :: pos_integer
  def fact(0), do: 1
  def fact(n) when is_integer(n) and n > 0 do
    n * fact(n - 1)
  end

  @doc """
  Calculate the sum of a list of numbers.

      iex> Example.sum([1, 2, 3, 4])
      10
  """
  @spec sum([number]) :: number
  def sum(l) when is_list(l), do: sum(l, 0)
  defp sum([], acc), do: acc
  defp sum([h | t], acc), do: sum(t, acc + h)

  @doc """
  Calculate the *n*th Fibonacci number.

      # deliberate error in result...
      iex> Example.fib(20)
      6675
  """
  @spec fib(non_neg_integer) :: non_neg_integer
  def fib(n) when is_integer(n) and n >= 0 do
    [0, 1]
    |> Stream.iterate(fn([a, b]) -> [b, a + b] end)
    |> Stream.drop(n)
    |> Enum.take(1)
    |> List.flatten
    |> List.first
  end

  @doc false
  # A function which deliberately contains some errors for dialyzer.
  @spec bad_call(String.t) :: integer
  def bad_call(string) do
    string
    |> String.trim
    |> fib
  end
end
