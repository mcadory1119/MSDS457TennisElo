# MSDS457TennisElo

R package for surface-adjusted Elo ratings in professional tennis.

The core functions calculate the probability that one player beats
another and update both players’ ratings after a match. Surface-specific
ratings (hard, clay, and grass) built on Jeff Sackmann’s ATP match data
are in development.

## Installation

``` r

# install.packages("devtools")
devtools::install_github("mcadory1119/MSDS457TennisElo")
```

## Usage

``` r

library(MSDS457TennisElo)

# Probability a 1700-rated player beats a 1500-rated player
elo_expected(1700, 1500)
#> [1] 0.7597469

# A 1400-rated player upsets a 1600-rated player
elo_update(1400, 1600)
#> $winner
#> [1] 1424.312
#>
#> $loser
#> [1] 1575.688
```
