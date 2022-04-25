#' Plot Adjusted Wages
#'
#' Draw a plot from an adjusted wage table made by `make_inflation_adjusted_wage_table()`.
#'
#' @param adjusted_wage_table A tibble with wages adjusted for inflation.
#'
#' @return A ggplot2 plot.
#' @export
#' @md
#'
#' @seealso [realwage::make_inflation_adjusted_wage_table()]
#'
#' @import ggplot2 dplyr magrittr
#' @importFrom rlang .data
plot_adjusted_wages <- function(adjusted_wage_table) {
  ggplot2::ggplot() +
    ggplot2::geom_line(data = adjusted_wage_table, ggplot2::aes(date, .data$value, group = .data$series, color = .data$series, linetype = .data$series)) +
    ggplot2::scale_linetype_manual(values = c('solid', rep('dashed', adjusted_wage_table %>% dplyr::select(.data$series) %>% unique() %>% dplyr::count() %>% dplyr::pull() - 1))) +
    ggplot2::geom_point(data = adjusted_wage_table %>% dplyr::filter(.data$series == 'Actual Salary'), ggplot2::aes(date, .data$value, color = .data$series)) +
    ggplot2::labs(x = 'Date', y = 'Salary (SEK)', colour = 'Inflation Adjustment', linetype = 'Inflation Adjustment', title = 'Salary Adjusted to Swedish Consumer Price Index') %>%
    return()
}
