#' Generate graduation color palette.
#' 
#' @param n       Integer. number of colors palette. 
#'                If vector, using length of vector, instead.
#' @param grad    Character vector. Graduation path using color() names.
#'                Default is from "blue" to "red".
#' @param alpha   See colorRamp
#' @param max     See colorRamp
#' 
#' @examples
#' genRGB_colorRamp(1:120)
#' genRGB_colorRamp(n=10, grad=c("black","green","red"), alpha = 128)
#' 
#' x=1:120
#' plot(x, col=genRGB_colorRamp(x))
#' 
#' @export

genRGB_colorRamp <- function(n,grad=c("blue","red"),alpha = 200, max=255){
  stopifnot(!missing(n))
  L <- ifelse(NROW(n)>1, NROW(n), n) 
  ramp <- colorRamp(grad)
  rgb( ramp(seq(0, 1, length = L)), alpha = alpha, max=max)
}


