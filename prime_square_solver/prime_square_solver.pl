#!/usr/bin/env perl6

my @primes = grep *.is-prime, 1..100;
@primes = keys @primes (-) (3, 5, 7, 13, 17);

check(|$_) for (|.permutations for @primes.combinations(4));

sub check($a11, $a22, $a32, $a23) {
    my @grid = (
        $a11,    3,   17 ;
           5, $a22, $a32 ;
          13, $a23,    7
    );

    my @numbers = (
        |@grid[0], ([+] @grid[0]),              # First row, sum of first row
        |@grid[1], ([+] @grid[1]),              # Second row, sum of second row
        |@grid[2], ([+] @grid[2]),              # Third row, sum of third row
        @grid[0;2] + @grid[1;1] + @grid[2;0],   # Sum of anti-diagonal
        ([+] @grid[^3;0]),                      # Sum of first column
        ([+] @grid[^3;1]),                      # Sum of second column
        ([+] @grid[^3;2]),                      # Sum of third column
        @grid[0;0] + @grid[1;1] + @grid[2;2]    # Sum of main diagonal
    );

    return if @numbers != @numbers.unique;

    return if grep { !$_.is-prime || $_ > 100 }, @numbers;

    return if !is-prime [+] @numbers;

    my $fmt = q:to "END";

         | %3s | %3s | %3s |   %3s
         +-----+-----+-----+
         | %3s | %3s | %3s |   %3s
         +-----+-----+-----+
         | %3s | %3s | %3s |   %3s
        /                   \
     %3s   %3s   %3s   %3s   %3s

                 %3s
END

    printf $fmt, @numbers, [+] @numbers;
}
