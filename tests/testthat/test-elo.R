test_that("equal ratings give a 50% chance", {
  expect_equal(elo_expected(1500, 1500), 0.5)
})

test_that("expected probabilities are symmetric", {
  expect_equal(elo_expected(1700, 1500) + elo_expected(1500, 1700), 1)
})

test_that("equal players move 16 points with k = 32", {
  out <- elo_update(1500, 1500)
  expect_equal(out$winner, 1516)
  expect_equal(out$loser, 1484)
})

test_that("rating points are conserved and upsets move more", {
  upset <- elo_update(1400, 1600)
  expect_equal(upset$winner + upset$loser, 3000)
  expect_gt(upset$winner - 1400, elo_update(1600, 1400)$winner - 1600)
})

test_that("bad inputs raise errors", {
  expect_error(elo_expected("a", 1500), "numeric")
  expect_error(elo_expected(c(1, 2), c(1, 2, 3)), "same length")
  expect_error(elo_update(1500, 1500, k = -5), "positive")
  expect_error(elo_update(NA, 1500), "missing")
})
