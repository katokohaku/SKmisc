
#' Print the number of duplicated elements.
#' 
#' @param vec     Vector assumed to contain duplicate elements.
#' @param get.vec If TRUE, return duplicated value. Default is FALSE.
#' 
#' @examples
#' get_dup(c(1:10,5:14))
#' get_dup(c(1:10,5:14), get.vec=TRUE)
#' get_dup(c(1:14), get.vec=TRUE)
#'
#' @export

get_dup <- function(vec, get.vec=FALSE){
  pos <-  which(duplicated(vec))
  dup_vec <- unique(vec[pos])
    catf("duplicated %i obs.: unique %i from %i obs. (diff=%i)",
         NROW(dup_vec), NROW(unique(vec)), NROW(vec), NROW(vec)-NROW(unique(vec)) )
  if(get.vec){
    return(dup_vec)
  }
}
