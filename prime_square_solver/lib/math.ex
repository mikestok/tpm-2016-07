defmodule Math do
  @moduledoc """
  A module to contain all of the math related things I need to mimic
  Perl 6's built in math operations.
  """

  @doc """
  Check if an integer is prime, naively based on the pseudocode at
  https://en.wikipedia.org/wiki/Primality_test#Pseudocode

  ## Parameters

    - n: An integer

  ## Examples

      iex> Math.prime?(1)
      false
      iex> Math.prime?(47)
      true
      iex> Math.prime?(48)
      false
  """

  @spec prime?(integer) :: boolean

  def prime?(n) when n <= 1, do: false
  def prime?(n) when n <= 3, do: true
  def prime?(n) when rem(n, 2) == 0 or rem(n, 3) == 0, do: false
  def prime?(n), do: prime?(n, 5)

  defp prime?(n, i) when i * i > n, do: true
  defp prime?(n, i) when rem(n, i) == 0 or rem(n, i + 2) == 0, do: false
  defp prime?(n, i), do: prime?(n, i + 6)

  @doc """
  Provide all the combinations of `n` elements in a list.

  Based on code found at http://stackoverflow.com/questions/30585697
  with the params re-ordered so we can use |> to send in the list.

  ## Parameters

    - xs: A list of items
    - n: The number of items in each combination

  ## Examples

      iex> Math.combinations([1, 2, 3], 2) |> Enum.sort
      [[1, 2], [1, 3], [2, 3]]
      iex> Math.combinations([1, 2], 5)
      []
  """

  @spec combinations(nonempty_list(any), integer) :: list(list(any))

  def combinations(_, 0), do: [[]]
  def combinations([], _), do: []
  def combinations([x | xs], n) do
    (for y <- combinations(xs, n - 1), do: [x | y]) ++ combinations(xs, n)
  end

  @doc """
  From http://rosettacode.org/wiki/Permutations#Elixir

  ## Examples

      iex> Math.permute([1, 2, 3]) |> Enum.sort
      [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]
  """

  @spec permute(list(any)) :: list(list(any))

  def permute([]), do: [[]]
  def permute(list) do
    for x <- list, y <- permute(list -- [x]), do: [x | y]
  end
end
