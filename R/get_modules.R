#' Retrieves a list of all module aliases
#'
#' Module aliases retrieved via get_modules() are used to define module IDs in shiny::callModule(),
#' and are also used as tabnames for the sidebar, and for the shiny UI label and id.
#'
#' @return list of strings containing module aliases
#' @export
#'
get_modules <- function(){
  # a list of all module names
  mod <- list(
    overview = "mod_overview",
    recruitment = "mod_recruitment",
    consent = "mod_consent",
    quality = "mod_quality",
    visits = "mod_visits",
    lab = "mod_lab",
    safety = "mod_safety",
    staff = "mod_staff"
  )
  return(mod)
}
