#' Loads data from export
#'
#' @return list of dataframes from secuTrial export
#' @seealso \code{\link{app_ui}}, \code{\link{app_srv}}
#' @export
#'
#'
get_data <- function(){

  #load("R/sysdata.rda")

    # A list of all dataframes from data export
  data <- list(
    baseline = dummy_baseline
  )

  return(data)
}

