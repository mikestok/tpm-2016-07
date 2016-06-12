# PrimeSquareSolver

Written out of interest to see how big Michał Wojciechowski's solver for this:
http://blogs.perl.org/users/michal_wojciechowski/2016/05/brutally-solving-a-logic-puzzle-with-perl-6.html
might be in Elixir.

```
$ perl6 -v
This is Rakudo version 2016.04 built on MoarVM version 2016.04
implementing Perl 6.c.
```

```
$ time ./prime_square_solver
    |  41 |   3 |  17 |    61
    +-----+-----+-----+
    |   5 |  23 |  19 |    47
    +-----+-----+-----+
    |  13 |  11 |   7 |    31
   /                   \
 53    59    37    43    71

            541


real	0m1.437s
user	0m1.333s
sys	0m0.146s
$ time ./prime_square_solver.pl

         |  41 |   3 |  17 |    61
         +-----+-----+-----+
         |   5 |  23 |  19 |    47
         +-----+-----+-----+
         |  13 |  11 |   7 |    31
        /                   \
      53    59    37    43    71

                 541

         |  11 |   3 |  17 |    31
         +-----+-----+-----+
         |   5 |  41 |  37 |    83
         +-----+-----+-----+
         |  13 |  23 |   7 |    43
        /                   \
      71    29    67    61    59

                 601

         |  11 |   3 |  17 |    31
         +-----+-----+-----+
         |   5 |  41 |  37 |    83
         +-----+-----+-----+
         |  13 |  53 |   7 |    73
        /                   \
      71    29    97    61    59

                 691

         |  11 |   3 |  17 |    31
         +-----+-----+-----+
         |   5 |  41 |  43 |    89
         +-----+-----+-----+
         |  13 |  53 |   7 |    73
        /                   \
      71    29    97    67    59

                 709

real	2m59.677s
user	2m57.566s
sys	0m1.760s
```
