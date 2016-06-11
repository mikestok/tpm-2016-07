# Materials for Toronto Perl Mongers talk July 2016

## Functional Programming

A solution to the http://adventofcode.com/day/10 puzzle.

To make things easier let's have a program I can run which is given the starting
string and the number of iterations to run, outputting the number of characters
in the result e.g.

    $ look-and-say 1321131112 40
    492982

## First in Perl

Perl 5.24.0

```
$ time perl5/look_and_say 1321131112 40
492982

real	0m0.729s
user	0m0.712s
sys	0m0.011s
$ time perl5/look_and_say 1321131112 50
6989950

real	0m9.150s
user	0m9.041s
sys	0m0.076s
$ time perl5/look_and_say 1321131112 60
99053158

real	2m7.223s
user	2m5.779s
sys	0m0.939s
```

## Resources
