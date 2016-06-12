defmodule PrimeSquareSolver do
  @moduledoc """
  The main program to drive the prime square solver.
  """

  # The problem is to fill in the blanks in a matrix like:
  #
  #  __  3 17
  #   5 __ __
  #  13 __  7
  #
  # so we call them
  #
  # a11 a21 a31
  # a12 a22 a32
  # a13 a23 a33
  @a21 3
  @a31 17
  @a12 5
  @a13 13
  @a33 7

  @blank_count 4

  def main(_args) do
    primes_lt_100 = (1 .. 99) |> Enum.filter(&(Math.prime?(&1)))
    primes = primes_lt_100 -- [@a21, @a31, @a12, @a13, @a33]

    primes
    |> Math.combinations(@blank_count)
    |> Enum.map(&(Math.permute(&1)))
    |> Enum.concat
    |> Enum.map(&check?/1)
    |> Enum.filter(&(&1))
    |> Enum.sort(&(List.last(&1) < List.last(&2)))
    |> List.first
    |> display
  end

  defp display(numbers) do
    numbers
    |> Enum.map(&(:io_lib.format("~3B", [&1])))
    |> Enum.map(&List.to_string/1)
    |> fill_template("""
                         | ___ | ___ | ___ |   ___
                         +-----+-----+-----+
                         | ___ | ___ | ___ |   ___
                         +-----+-----+-----+
                         | ___ | ___ | ___ |   ___
                        /                   \\
                     ___   ___   ___   ___   ___

                                 ___
                     """, "___")
    |> IO.puts
  end

  @spec check?(list(integer)) :: false | list(integer)
  defp check?([a11, a22, a32, a23]) do
    numbers = score(make_square([a11, a22, a32, a23]))
    result = numbers ++ [Enum.sum(numbers)]

    cond do
      numbers != Enum.uniq(numbers) -> false
      Enum.any?(numbers, &(&1 > 100)) -> false
      Enum.any?(result, &(not Math.prime?(&1))) -> false
      true -> result
    end
  end

  @spec score(Square.t) :: list(integer)
  defp score(square = %Square{}) do
    row_results = square |> Square.rows |> Enum.map(&(&1 ++ [Enum.sum(&1)]))
    anti_diagonal_sum = square |> Square.anti_diagonal |> Enum.sum
    column_sums = square |> Square.columns |> Enum.map(&Enum.sum/1)
    diagonal_sum = square |> Square.diagonal |> Enum.sum

    List.flatten([row_results, anti_diagonal_sum, column_sums, diagonal_sum])
  end

  @spec make_square(list(integer)) :: Square.t
  defp make_square([a11, a22, a32, a23]) do
    Square.new([[a11, @a21, @a31], [@a12, a22, a32], [@a13, a23, @a33]])
  end

  @doc """
  Crude template filler which "interpolates" the fillers into a template by
  replacing the marker.

  Simple implementation which stops interpolating as soon as it runs out of
  fillers or markers, so make sure you supply the right number of fillers!

  ## Parameters

    - fillers: A list of strings to use to replace the markers
    - template: A string containing markers to be replaced
    - marker: The string which is the marker in the template

  ## Examples

      iex> PrimeSquareSolver.fill_template(["1", "2"], "AxBxC", "x")
      "A1B2C"
      iex> PrimeSquareSolver.fill_template(["1", "2"], "xBxC", "x")
      "1B2C"
      iex> PrimeSquareSolver.fill_template(["1", "2"], "AxBx", "x")
      "A1B2"
  """
  @spec fill_template(list(String.t), String.t, String.t) :: String.t
  def fill_template(fillers, template, marker) do
    template
    |> String.split(marker)
    |> Enum.zip(fillers ++ [""])
    |> Enum.map(&Tuple.to_list/1)
    |> List.flatten
    |> Enum.join
  end
end
