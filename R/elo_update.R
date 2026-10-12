#' Update Elo ratings after a match
#'
#' Updates both players' ratings after a single match. The winner gains
#' rating points and the loser drops the same amount, scaled by the K-factor
#' and by how surprising the result was. Inputs follow the winner/loser
#' layout of the ATP match data.
#'
#' @param winner_rating Numeric. Rating(s) of the match winner before the
#'   match.
#' @param loser_rating Numeric. Rating(s) of the match loser before the
#'   match.
#' @param k Numeric. K-factor, the maximum number of points a single match
#'   can move a rating. Defaults to 32.
#' @inheritParams elo_expected
#'
#' @return A list with elements `winner` and `loser` holding the updated
#'   ratings.
#' @export
#'
#' @examples
#' # Two equal players: the winner gains 16 points
#' elo_update(1500, 1500)
#'
#' # An upset moves more points than an expected result
#' elo_update(1400, 1600)
#'
#' # A smaller K-factor makes ratings move more slowly
#' elo_update(1400, 1600, k = 16)
elo_update <- function(winner_rating, loser_rating, k = 32, scale = 400) {
  check_ratings(winner_rating, "winner_rating")
  check_ratings(loser_rating, "loser_rating")
  check_positive_number(k, "k")

  p_win  <- elo_expected(winner_rating, loser_rating, scale = scale)
  change <- k * (1 - p_win)

  list(winner = winner_rating + change,
       loser  = loser_rating - change)
}
