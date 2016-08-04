#' Plot point stile using the number of "pch" of plot()
#' 
#' @param i   Integer. The number of pch. See \code{\link{pch}}.
#' @param adj Numeric. Adjunstment of test label position.
#' 
#' @examples
#' view_plot_pch_styles(3:1)
#' 
#' @export
#' 

view_plot_pch_styles <-function(i,adj=0.05){
  x= if(missing(i)){ 0:25 } else{ i }
  y= rep(1,length(x))
  ty= adj*rep(-1,length(x))^(1+1:length(x))
  plot(y~x,type="p",pch=x,cex=1.5,xaxt="n",yaxt="n",ann=FALSE)
  text(y+ty~x, labels=paste0(x))
}
