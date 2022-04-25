#' Calculate and Plot Adjusted Salary
#'
#' Plots wages adjusted for inflation.
#'
#' Takes a tibble of wages, formatted with columns *year*, *month*, and *salary*. Desired start and end dates for the plot can be specified in ISO format (yyyy-mm-dd). If no start and end dates are specified the whole period is plotted.
#'
#' Returns a ggplot2 object.
#'
#' @param wage_table A tibble with *year*, *month*, and *salary* columns.
#' @param start_date Optional. A date in ISO format (yyyy-mm-dd).
#' @param end_date Optional. A date in ISO format (yyyy-mm-dd).
#'
#' @return A ggplot2 object.
#' @export
#'
#' @import dplyr lubridate magrittr
calculate_and_plot_adjusted_salary <- function(wage_table, start_date = NULL, end_date = NULL) {
  adjusted_table <- wage_table %>%
    make_inflation_adjusted_wage_table()

  if (!is.null(start_date)) {
    adjusted_table <- adjusted_table %>%
      dplyr::filter(date >= lubridate::ymd(start_date))
  }

  if (!is.null(end_date)) {
    adjusted_table <- adjusted_table %>%
      dplyr::filter(date <= lubridate::ymd(end_date))
  }

  adjusted_table %>%
    plot_adjusted_wages() %>%
    return()
}
