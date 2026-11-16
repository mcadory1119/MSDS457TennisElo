# Update Elo ratings after a match

Updates both players' ratings after a single match. The winner gains
rating points and the loser drops the same amount, scaled by the
K-factor and by how surprising the result was. Inputs follow the
winner/loser layout of the ATP match data.

## Usage

``` r
elo_update(winner_rating, loser_rating, k = 32, scale = 400)
```

## Arguments

- winner_rating:

  Numeric. Rating(s) of the match winner before the match.

- loser_rating:

  Numeric. Rating(s) of the match loser before the match.

- k:

  Numeric. K-factor, the maximum number of points a single match can
  move a rating. Defaults to 32.

- scale:

  Numeric. Rating gap that produces 10-to-1 odds. Defaults to 400, the
  standard chess value.

## Value

A list with elements `winner` and `loser` holding the updated ratings.

## Examples

``` r
# Two equal players: the winner gains 16 points
elo_update(1500, 1500)
#> $winner
#> [1] 1516
#> 
#> $loser
#> [1] 1484
#> 

# An upset moves more points than an expected result
elo_update(1400, 1600)
#> $winner
#> [1] 1424.312
#> 
#> $loser
#> [1] 1575.688
#> 

# A smaller K-factor makes ratings move more slowly
elo_update(1400, 1600, k = 16)
#> $winner
#> [1] 1412.156
#> 
#> $loser
#> [1] 1587.844
#> 
```
