#' Get Index Value
#'
#' Gets the index value from a table imported by `get_cpi()`.
#'
#' @param cpi_table A table imported by `get_cpi()`.
#' @param index_year The year to extract the index value for.
#' @param index_month The month to extract the index value for.
#'
#' @return A numeric index value.
#' @export
#' @md
#'
#' @import dplyr magrittr
#' @importFrom rlang .data
#'
#' @seealso [realwage::get_cpi()]
get_index_value <- function(cpi_table, index_year, index_month) {
  cpi_table %>%
    dplyr::filter(year == index_year & month == index_month) %>%
    dplyr::select(.data$value) %>%
    dplyr::pull() %>%
    return()
}
