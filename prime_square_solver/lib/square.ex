defmodule Square do
  @moduledoc """
  Make a data type for squares
  """
  @type t :: %Square{matrix: list(list(any))}
  defstruct matrix: [[]]

  @spec new(list(list(any))) :: Square.t
  def new(matrix) do
    # TODO: check for squareness
    %Square{matrix: matrix}
  end

  @doc """
  ## Examples

      iex> Square.new([[1, 2, 3], [4, 5, 6], [7, 8, 9]]) |> Square.rows
      [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  """
  @spec rows(Square.t) :: list(list(any))
  def rows(%Square{matrix: matrix}) do
    matrix
  end

  @doc """
  ## Examples

      iex> Square.new([[1, 2, 3], [4, 5, 6], [7, 8, 9]]) |> Square.columns
      [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
  """
  # TODO: understand dialyzer message when this is uncommented
  # @spec columns(Square.t) :: list(list(any))
  def columns(%Square{matrix: matrix}) do
    transpose(matrix)
  end

  @doc """
  ## Examples

      iex> Square.new([[1, 2, 3], [4, 5, 6], [7, 8, 9]]) |> Square.diagonal
      [1, 5, 9]
  """
  @spec diagonal(Square.t) :: list(any)
  def diagonal(%Square{matrix: matrix}) do
    diag(matrix)
  end

  @doc """
  ## Examples

      iex> Square.new([[1, 2, 3], [4, 5, 6], [7, 8, 9]]) |> Square.anti_diagonal
      [3, 5, 7]
  """
  @spec anti_diagonal(Square.t) :: list(any)
  def anti_diagonal(%Square{matrix: matrix}) do
    matrix
    |> Enum.map(&Enum.reverse/1)
    |> diag
  end

  defp diag([[]]), do: []
  defp diag([[x]]), do: [x]
  defp diag([[x | _] | xss]), do: [x | diag(for [_ | t] <- xss, do: t)]

  # https://gist.github.com/pmarreck/6e054c162844e9d83d89
  defp transpose([]), do: []
  defp transpose([[] | xss]), do: transpose(xss)
  defp transpose([[x | xs] | xss]) do
    [[x | (for [h | _] <- xss, do: h)] | transpose([xs | (for [_ | t] <- xss, do: t)])]
  end
end
