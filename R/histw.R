#' @title
#' Plot histgram using bin width.
#' @description 
#' Plot histgram using bin width using  direct plug-in methodology. See \link{dpih}.
#' @param
#' data    [vector]
#' @param
#' bw      [numeric]\cr 
#' Bin width for plotting histgram. Deafault is NULL (autmatic).
#' @param
#'  ...    Other option of \code{\link{hist}}
#'  
#' @examples
#' histw(rnorm(100))
#' histw(rnorm(100),bw=2)

#' 
#' @importFrom KernSmooth dpih
#' @export

histw <- function(data, bw=NULL, ...){
  stopifnot(!missing(data))
  if(is.null(bw)) bw <- dpih(data)
  catf("binwidth = %f",bw)
  breaks <- seq(min(data)-bw,max(data)+bw,bw)
  hist(data, breaks=breaks, ...)
}



