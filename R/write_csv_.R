#' write CSV file with filename= objectName_timestamp.csv.
#' 
#' @param x    Matrix or data.frame.
#' @param base    Character. Default is NA, uses object name.
#' @param ...     See \code{\link{write.table}} 
#' 
#' @examples
#' df <- data.frame(x=1:10,y=letters[1:10])
#' write.csv_(df)
#' write.csv_(df, base="other_filename")
#' 
#' @importFrom data.table fread 
#' @export
#' 
write.csv_ <- function(x, base=NA, row.names=F, ...){
  ex <- substitute(x)
  if(!is.character(base)){ base<-ex }
  fn=paste0(base,"_",strftime(Sys.time(),format="%Y%m%d%H%M"),".csv")
  print(fn)
  this<-eval(expr = ex,envir = parent.frame())
  write.table(this,file=fn,sep=",",col.names=T,row.names=row.names,...)
}
