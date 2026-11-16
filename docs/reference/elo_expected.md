# Expected win probability from two Elo ratings

Calculates the probability that player A beats player B, based only on
the gap between their Elo ratings, using the standard logistic Elo
formula \\E_A = 1 / (1 + 10^{(R_B - R_A) / scale})\\. A 0-point gap
gives 0.5; a player rated 200 points higher wins about 76% of the time.

## Usage

``` r
elo_expected(rating_a, rating_b, scale = 400)
```

## Arguments

- rating_a:

  Numeric. Elo rating(s) for player A.

- rating_b:

  Numeric. Elo rating(s) for player B. Must be the same length as
  `rating_a`, or length 1.

- scale:

  Numeric. Rating gap that produces 10-to-1 odds. Defaults to 400, the
  standard chess value.

## Value

A numeric vector of probabilities between 0 and 1 that player A wins.

## Examples

``` r
# Equal ratings give a 50% chance
elo_expected(1500, 1500)
#> [1] 0.5

# A 200-point favorite wins about 76% of the time
elo_expected(1700, 1500)
#> [1] 0.7597469

# Vectorized over several matchups
elo_expected(c(1600, 1800, 2000), 1700)
#> [1] 0.3599350 0.6400650 0.8490204
```
