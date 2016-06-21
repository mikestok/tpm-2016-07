defmodule Example do
  @moduledoc """
  Sample code for first section of the presentation.  The docs are in
  `markdown` so we can do simple formatting.
  """

  # Example.func/1 and Example.func/2 are different functions because they
  # have different arity (number of arguments)

  # Example.func/1
  def func(arg), do: func(arg, 0)

  # Example.func/2
  def func(arg, n) do
    IO.puts("Called with #{arg} and #{n}")
  end

  # This recursive factorial is *not* tail-recursive, so it can blow the stack
  # if it does enough iterations.
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

  # Different from the slides because it needs a different name, and the slide
  # formatting means tr_fact is too long for some lines...
  @doc """
  Calculate the factorial of a number using tail recursion.

      iex> Example.tr_fact(10)
      3628800
  """
  @spec tr_fact(non_neg_integer) :: pos_integer
  def tr_fact(n) when is_integer(n) and n >= 0 do
    tr_fact(n, 1)
  end
  defp tr_fact(0, acc), do: acc
  defp tr_fact(n, acc), do: tr_fact(n - 1, n * acc)

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
