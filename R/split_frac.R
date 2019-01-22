#' @title 
#' Devide a matrix or a data.frame into two subsets.
#' 
#' @description
#' Similar function as dplyr::sample_frac but return both sampled and remained subset.
#' 
#' @param  tbl  [a matrix] or [a data.frame] to be split.
#' @param  size [a mumeric] Sampling ratio. Must be between 0 and 1. 
#'  
#' @examples
#' sep_iris <- splitFrac(iris, 0.8)
#' str(sep_iris)
#' 
#' @return a list
#' @export

splitFrac <- function(tbl, size=1)
{
  stopifnot(NROW(tbl)>1, size<=1, size>0)
  pos <- sample(NROW(tbl), size*NROW(tbl), replace=FALSE)

  
  list(sample = tbl[pos,],
       remain = tbl[-pos,])
}

