This is a little exercise I found the daily programmer reddit.
https://www.reddit.com/r/dailyprogrammer/comments/4uhqdb/20160725_challenge_277_easy_simplifying_fractions/

I did not use any built in functionality to find the greatest common denominator.  I instead used a list of primes to check against and simplify the fraction given.

I had it in my head to use a recursive simplifier method for the simplification.  I chose Arrays as the datastructure for passing a fraction into and out of the method as well as a fast structure to use to hold the first 1000 prime numbers.  Primes.txt is a list of prime numbers that I found here:  https://primes.utm.edu/lists/small/1000.txt
