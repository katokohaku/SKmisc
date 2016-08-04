#' Count the nummber of unique elements (or unique rows of data.frame)
#' 
#' @param ... see \code{\link{unique}}
#' 
#' @export

UC<-function(x,...){ NROW(unique(x,...)) }
