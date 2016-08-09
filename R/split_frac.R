#' @title 
#' Devide a matrix or a data.frame into two subsets.
#' @description
#' Similar function as dplyr::sample_frac but return both sampled and remained subset.
#' 
#' @param
#' tbl  [a matrix] or [a data.frame]
#' @param 
#' size [a mumeric]\cr 
#' Sampling ration against NROW(tbl), must be in (0..1]. 
#'  
#' @examples
#' sep_iris <- Split_Frac(iris,0.8)
#' str(sep_iris)
#' 
#' @export

Split_Frac <- function(tbl, size=1)
{
  stopifnot(NROW(tbl)>1, size<=1, size>0)
  pos <- sample(NROW(tbl), size*NROW(tbl), replace=FALSE)

  
  list(sample = tbl[pos,],
       remain = tbl[-pos,])
}

