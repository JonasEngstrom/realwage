#' Make Inflation Adjusted Wage Table
#'
#' Given a tibble of wages, formatted with *year*, *month*, and *salary* columns, the function calculates the inflation adjusted wage for every past salary up to the current day.
#'
#' @param wage_table A tibble of wages, formatted with *year*, *month*, and *salary* columns.
#'
#' @return A tibble with columns for *year*, *month*, actual *salary* and one inflation adjuted column per past salary.
#' @export
#' @md
#'
#' @import dplyr
make_inflation_adjusted_wage_table <- function(wage_table) {
  current_year <- wage_table %>%
    dplyr::slice(1) %>%
    dplyr::pull(year)

  current_month <- wage_table %>%
    dplyr::slice(1) %>%
    dplyr::pull(month)

  adjusted_table <- wage_table %>%
    adjust_for_inflation(get_cpi()) %>%
    dplyr::select(year, month, starts_with('wage')) %>%
    dplyr::left_join(wage_table, by = c('year', 'month')) %>%
    dplyr::filter((year == current_year & month >= current_month) | year > current_year)

  for (i in 1:nrow(wage_table)) {
    current_year <- wage_table %>%
      dplyr::slice(i) %>%
      dplyr::pull(year)

    current_month <- wage_table %>%
      dplyr::slice(i) %>%
      dplyr::pull(month)

    adjusted_table <- adjusted_table %>%
      dplyr::mutate(dplyr::across(!!paste('wage', current_year, current_month, sep = '_'), ~ ifelse((year == current_year & month >= current_month) | year > current_year, .x, NA)))
  }

  adjusted_table %>%
    return()
}
