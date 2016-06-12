defmodule MathTest do
  use ExUnit.Case
  doctest Math

  # http://www.ask.com/math/prime-numbers-less-100-3ea8ce05c7c21b1a
  @primes_lt_100 [
    2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71,
    73, 79, 83, 89, 97
  ]

  test "prime?" do
    assert (1 .. 100) |> Enum.filter(&(Math.prime?(&1))) == @primes_lt_100
  end
end
