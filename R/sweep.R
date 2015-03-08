#' sweep.js for R
#'
#' htmlwidget using the \href{https://github.com/rileyjshaw/sweep}{sweep.js}
#' library enabling color transitions through the HSL and HUSL spaces.
#'
#' @param selector \code{String} selector id on which to apply sweep.
#' @param options \code{list} configuration options for Sortable.  For a throrough
#'   discussion, see \href{https://github.com/rileyjshaw/sweep#usage}{Sweep Usage}.
#'   Below is the list of supported options.
#'   \itemize{
#'      \item target
#'      \item properties
#'      \item fromColor
#'      \item toColor
#'      \item options
#'      \item callback
#'      \item direction
#'      \item space
#'   }#'
#' @import htmlwidgets
#'
#' @export

sweep <- function(
  selector
  , options = NULL
  , width = NULL
  , height = NULL
) {

  # forward options using x
  x = list(
    selector = selector
    , options = options
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
