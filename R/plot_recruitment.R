#' Plot recruitment curve
#'
#' This function plots a recruitment curve by centers
#'
#'
#' @return list of dataframes from secuTrial export
#' @import ggplot2
#' @import plotly
#' @import magrittr
#' @export
#'
#'
plot_recruitment <- function(data, date.var, centre.var){
  
  enr <- data
  
  ## Order by signed consent date and select only 2 columns
  df <- enr[order(enr[[date.var]]), c(date.var, centre.var)]
  ## Include row numbers for df
  df <- data.frame(df, 1:nrow(enr))
  ## Allocate to another df name
  df.center <- df
  ## Group by center and allocate row id
  for(i in 1:nrow(df.center)) {
    df.center[i, "n"] <- sum(df.center[1:i, centre.var] == df.center[i, centre.var])
  }
  ## Allocate factor levels for centers
  #df.center$center <- factor(df.center$centre, levels = c("All", sort(levels(df.center$centre))))
  df.center.all <- df.center
  ## Get levels of centers without "All"
  ctr.levels <- levels(factor(df.center[[centre.var]]))
  
  df.center.all$centre <- "All"
  df.center.all$n <- df.center.all[,3]
  df.center <- rbind(df.center, df.center.all)
  names(df.center) <- c("Baseline", "Center", "total", "n")
  df.center$Center <- factor(df.center$Center, levels = c("All", ctr.levels))
  
  
  p <- ggplot() + geom_line(mapping = aes(x = Baseline, y = n, color = Center), data = df.center) +
    labs(x = "Date of randomization", y = "Patients included") + theme_bw()
  ggplotly(p)
}

