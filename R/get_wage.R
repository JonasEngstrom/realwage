#' Get Wage
#'
#' Gets the salary from a table formatted with *year*, *month*, and *salary* columns.
#'
#' @param wage_table A table with columns named *year*, **month*, and *salary*.
#' @param index_year The year to extract the salary for.
#' @param index_month The month to extract the salary for.
#'
#' @return A salary.
#' @export
#' @md
#'
#' @import dplyr magrittr
#' @importFrom rlang .data
get_wage <- function(wage_table, index_year, index_month) {
  wage_table %>%
    dplyr::filter(year == index_year & month == index_month) %>%
    dplyr::select(.data$salary) %>%
    dplyr::pull() %>%
    return()
}
