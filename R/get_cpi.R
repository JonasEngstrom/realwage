#' Get Consumer Price Index
#'
#' Downloads Consumer Price Index data from Statistics Sweden.
#'
#' Downloads [Swedish Consumer Price Index data from Statistics Sweden](http://www.statistikdatabasen.scb.se/pxweb/sv/ssd/START__PR__PR0101__PR0101A/KPIFastM2).
#' The data set starts in January of 2006, with an index value of 100 occuring during 1980.
#'
#' The function returns a tibble with three columns; year, month, and value. Months are numbered rather than named.
#'
#' @return A tibble with three columns; year, month, and value.
#' @export
#' @md
#'
#' @import httr magrittr jsonlite purrr tidyr dplyr
#'
#' @examples
#' cpi_data <- get_cpi()
get_cpi <- function() {
  url = 'https://api.scb.se/OV0104/v1/doris/sv/ssd/START/PR/PR0101/PR0101A/KPIFastM2'
  query = '{ "query": [], "response": { "format": "json" } }'

  httr::POST(url, body = query) %>%
    httr::content(as = 'text') %>%
    jsonlite::fromJSON() %>%
    purrr::pluck('data') %>%
    tidyr::unnest(cols = dplyr::everything()) %>%
    tidyr::separate(key, c('year', 'month'), 'M') %>%
    dplyr::mutate(dplyr::across(c(year, month), as.integer)) %>%
    dplyr::mutate(dplyr::across(values, as.double)) %>%
    dplyr::rename(value = values) %>%
    return()
}