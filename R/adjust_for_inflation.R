#' Adjust Wages for Inflation
#'
#' Calculate percentual change and absolute change values for wages.
#'
#' Given a tibble of wages, formatted with *year*, *month*, and *salary*
#' columns, and a tibble containing CPI data imported by `get_cpi()`, the
#' function calculates relative and absolute inflation adjustments.
#'
#' The function returns a tibble with columns named pct_*year*_*month* and
#' wage_*year*_*month* for each month in the wage table.
#'
#' @param wage_table A table with *year*, *month*, and *salary* columns.
#' @param cpi_table A table imported by `get_cpi()`.
#'
#' @return A tibble with pct_*year*_*month* and wage_*year*_*month* added for
#'   each month in `wage_table`.
#' @export
#' @md
#'
#' @seealso [realwage::get_cpi()]
#'
#' @import dplyr
adjust_for_inflation <- function(wage_table, cpi_table) {
  for (i in 1:nrow(wage_table)) {

    cpi_table <- cpi_table %>%
      add_adjustment_column(wage_table %>% dplyr::slice(i) %>% dplyr::select(year) %>% dplyr::pull(),
                            wage_table %>% dplyr::slice(i) %>% dplyr::select(month) %>% dplyr::pull())

    cpi_table <- cpi_table %>%
      add_wage_column(wage_table,
                      wage_table %>% dplyr::slice(i) %>% dplyr::select(year) %>% dplyr::pull(),
                      wage_table %>% dplyr::slice(i) %>% dplyr::select(month) %>% dplyr::pull())
  }

  return(cpi_table)
}
