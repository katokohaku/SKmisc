
#' Binary operator just to negate of intersect two vectors
#' @description
#' (! x %in% y)
#' @param 
#' x,y [a vector]
#' 
#' @examples
#' 1:7 %in%  3:5 # F,F,T,T,T,F,F
#' 1:7 %nin% 3:5 # T,T,F,F,F,T,T
#' 
#' @export

`%nin%` <- Negate(`%in%`)

#' Binary operator just to paste a string with a string.
#' 
#' @param 
#' x,y [a string]
#' 
#' @examples
#' "aa" %+% "bb" %+% "cc"
#' 
#' @export
#'
#'
`%+%` <- function(x,y) paste0(x,y)                      


#' Convert vector -> String
#' 
#' @param x [a vector]
#' 
#' @examples
#' hoge <- s2v("hoge")
#' 
#' @importFrom stringr str_split
#' @export
#' 
s2v <- function(x){ unlist( str_split(x,"") ) } 

#' Convert String -> vector
#' 
#' @param x [a string]
#' 
#' @examples
#' hoge <- s2v("hoge")
#' v2s(hoge)
#' 
#' @export
#' 
v2s <- function(x){ paste0(x, sep="", collapse="") }
