#' sweep.js for R
#'
#' htmlwidget using the \href{https://github.com/rileyjshaw/sweep}{sweep.js}
#' library enabling color transitions through the HSL and HUSL spaces.
#' 
#' @import htmlwidgets
#'
#' @export

sweep <- function(message, width = NULL, height = NULL) {

  # forward options using x
  x = list(
    message = message
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'sweep',
    x,
    width = width,
    height = height,
    package = 'sweep'
  )
}

#' Widget output function for use in Shiny
#'
#' @export
sweepOutput <- function(outputId, width = '100%', height = '400px'){
  shinyWidgetOutput(outputId, 'sweep', width, height, package = 'sweep')
}

#' Widget render function for use in Shiny
#'
#' @export
renderSweep <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, sweepOutput, env, quoted = TRUE)
}
