#' Add Wage Column
#'
#' Adds a column to a CPI table that has had adjustment columns created by
#' `add_adjustment_column()` containing wages zeroed on a given month. The new
#' column in named wage_*year*_*month*.
#'
#' @param cpi_table A table made by `add_adjustment_column()`.
#' @param wage_table A table with columns named *year*, **month*, and *salary*.
#' @param zero_year The year to zero wage on.
#' @param zero_month The month to zero wage on.
#'
#' @return A CPI table with an additional column named wage_*year*_*month*.
#' @export
#' @md
#'
#' @seealso [realwage::add_adjustment_column()]
#'
#' @import dplyr magrittr
add_wage_column <- function(cpi_table, wage_table, zero_year, zero_month) {
  cpi_table %>%
    dplyr::mutate(!!paste('wage', zero_year, zero_month, sep = '_') := !!as.name(paste('pct', zero_year, zero_month, sep = '_')) * get_wage(wage_table, zero_year, zero_month) + get_wage(wage_table, zero_year, zero_month)) %>%
    return()
}
