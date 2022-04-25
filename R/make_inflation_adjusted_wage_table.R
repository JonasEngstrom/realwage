#' Make Inflation Adjusted Wage Table
#'
#' Given a tibble of wages, formatted with *year*, *month*, and *salary*
#' columns, the function calculates the inflation adjusted wage for every past
#' salary up to the current day.
#'
#' @param wage_table A tibble of wages, formatted with *date*, and *salary*
#'   columns. The day component of the dates is set to 1.
#'
#' @return A tibble with columns for *date*, actual *salary* and one inflation
#'   adjuted column per past salary.
#' @export
#' @md
#'
#' @import dplyr lubridate stringr magrittr
#' @importFrom rlang .data
#' @importFrom tidyr pivot_longer drop_na
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
    dplyr::mutate(date = lubridate::ym(paste(year, month))) %>%
    dplyr::select(date, .data$salary, starts_with('wage')) %>%
    tidyr::pivot_longer(!date, names_to = 'series') %>%
    tidyr::drop_na() %>%
    dplyr::mutate(adj_date = stringr::str_extract(.data$series, '\\d{4}_\\d{1,2}') %>% lubridate::ym()) %>%
    dplyr::mutate(across(.data$series, ~ifelse(.data$series == 'salary', 'Actual Salary', paste('Starting', lubridate::month(.data$adj_date, label = TRUE, abbr = FALSE), lubridate::year(.data$adj_date))))) %>%
    dplyr::select(!.data$adj_date) %>%
    return()
}
