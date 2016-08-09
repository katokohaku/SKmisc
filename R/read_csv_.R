#' read CSV file with fread.
#' 
#' @param 
#' file    [Character]\cr
#' Path to file.
#' @param 
#' data.table [Logical]\cr
#' If TRUE, return data.table object. Default is FALSE.
#' @param
#' sep     [Character]\cr 
#' Delimitor of ASCII file. Default is "," (as CSV file).
#' @param 
#' ...     
#' See \code{\link{fread}} 
#' 
#' @importFrom data.table fread 
#' @export
#' 
read.csv_ <- function(file, data.table=FALSE, sep=",",...){
  df <- fread(file, sep=sep, data.table=data.table, ...)
  catf("loaded: %i rows, %i cols",NROW(df), NCOL(df))
  return(df)
}
