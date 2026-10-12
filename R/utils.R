# Internal input checks shared by the rating functions. Not exported.

check_ratings <- function(x, arg) {
  if (!is.numeric(x) || length(x) == 0 || anyNA(x)) {
    stop("`", arg, "` must be a non-empty numeric vector with no missing values.",
         call. = FALSE)
  }
  invisible(x)
}

check_positive_number <- function(x, arg) {
  if (!is.numeric(x) || length(x) != 1 || is.na(x) || x <= 0) {
    stop("`", arg, "` must be a single positive number.", call. = FALSE)
  }
  invisible(x)
}
