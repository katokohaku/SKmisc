#' Personal customized str()
#' 
#' @param ... see \code{\link{str}}
#' 
#' @export

str_ <- function(x, max.level=2, give.head=TRUE,
                 give.attr=FALSE, no.list=TRUE, ...){
  str(x, give.head=give.head, give.attr=give.attr,
      no.list=no.list, max.level = max.level, ...)
}
