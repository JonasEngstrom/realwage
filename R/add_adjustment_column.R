#' Add Adjustment Column
#'
#' Adds a column to a CPI table imported by `get_cpi()` containing adjustment
#' factors zeroed on a given month. The new column in named pct_*year*_*month*.
#'
#' @param cpi_table A table imported by `get_cpi()`.
#' @param zero_year The year to zero adjustment factors on.
#' @param zero_month The month to zero adjustment factors on.
#'
#' @return A CPI table with an additional column named pct_*month*_*year*.
#' @export
#' @md
#'
#' @seealso [realwage::get_cpi()]
#'
#' @import dplyr
add_adjustment_column <- function(cpi_table, zero_year, zero_month) {
  cpi_table %>%
    dplyr::mutate(!!paste('pct', zero_year, zero_month, sep = '_') := percentual_change(get_index_value(cpi_table, zero_year, zero_month), value)) %>%
    return()
}
