# Code to Support TPM July 2016 Presentation

Here's what's in the directories:

## [iex_example](iex_example)

The code from the `Example` module in a single elixir script so we can run it
in `iex` like this:

```
$ cd iex_example
$ iex example.exs
Erlang/OTP 18 [erts-7.3] [source] [64-bit] [smp:8:8] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

Interactive Elixir (1.2.6) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> Example.sum([5, 0.1, -100])
-94.9
```

## [example](example)

A directory with instructions for using `mix` to set up an `example` project
into which we can copy the content of `iex_example/example.exs` and run the
doctests, generate documentation, use `dialyzer` etc.

## [look_and_say](look_and_say)

A part of one of the problems from http://adventofcode.com solved
in perl5, and a couple of elixir solutions.

## [prime_square_solver](prime_square_solver)

Inspired by Michał Wojciechowski's [perl.org blog
post](http://blogs.perl.org/users/michal_wojciechowski/2016/05/brutally-solving-a-logic-puzzle-with-perl-6.html)
solving a simple logic problem using brute force.
