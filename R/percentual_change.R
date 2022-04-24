#' Calculate Percentual Change
#'
#' Calculates the percentual change from a start to an end value.
#'
#' @param start_value Start value.
#' @param end_value End value.
#'
#' @return Percentual change.
#' @export
#'
#' @examples
#' percentual_change(140, 180)
percentual_change <- function(start_value, end_value) {
  (end_value - start_value) / start_value
}
