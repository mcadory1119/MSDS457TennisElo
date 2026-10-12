#' Expected win probability from two Elo ratings
#'
#' Calculates the probability that player A beats player B, based only on
#' the gap between their Elo ratings, using the standard logistic Elo formula
#' \eqn{E_A = 1 / (1 + 10^{(R_B - R_A) / scale})}. A 0-point gap gives 0.5;
#' a player rated 200 points higher wins about 76% of the time.
#'
#' @param rating_a Numeric. Elo rating(s) for player A.
#' @param rating_b Numeric. Elo rating(s) for player B. Must be the same
#'   length as `rating_a`, or length 1.
#' @param scale Numeric. Rating gap that produces 10-to-1 odds. Defaults to
#'   400, the standard chess value.
#'
#' @return A numeric vector of probabilities between 0 and 1 that player A
#'   wins.
#' @export
#'
#' @examples
#' # Equal ratings give a 50% chance
#' elo_expected(1500, 1500)
#'
#' # A 200-point favorite wins about 76% of the time
#' elo_expected(1700, 1500)
#'
#' # Vectorized over several matchups
#' elo_expected(c(1600, 1800, 2000), 1700)
elo_expected <- function(rating_a, rating_b, scale = 400) {
  check_ratings(rating_a, "rating_a")
  check_ratings(rating_b, "rating_b")
  check_positive_number(scale, "scale")

  if (length(rating_a) != length(rating_b) &&
      length(rating_a) != 1 && length(rating_b) != 1) {
    stop("`rating_a` and `rating_b` must be the same length, or one must be length 1.",
         call. = FALSE)
  }

  1 / (1 + 10^((rating_b - rating_a) / scale))
}
