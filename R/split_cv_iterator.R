#' @title
#' Iterator preparation for cross validation
#' @description
#' Iterator preparation for n-fold & leave-one-out (loo) cross validation\cr
#' deviding almost equally sizes of train with test subsets.\cr
#' NOTE: Iterator will not be shuffled
#' @param
#' size [integer]\cr
#' Number of data, sample size. Usually NROW(data.frame). 
#' @param
#' fold [integer]\cr
#' Number of folding. If missing, set loo-mode(loo=TRUE).
#' @param
#' loo [logical]\cr
#' Default is FALSE. If TRUE, set loo-mode(loo=TRUE).
#' 
#' @examples
#' # 4-fold cross
#' x <- Split_CV_Iterator(NROW(iris), 4)
#' str(x,max.level = 3)
#' CV1.train <- iris[x[[1]]$train,]
#' CV1.test  <- iris[x[[1]]$test, ]
#' 
#' # leave-one-out cross-validation
#' Split_CV_Iterator(4, loo=TRUE)
#' 
#' # if missing "fold", automatically loo.
#' Split_CV_Iterator(10)
#' 
#' @return a list
#' @export

Split_CV_Iterator <- function(size, fold, loo=FALSE)
{
  stopifnot(!missing(size))
  if(missing(fold)){ loo=TRUE }
  if(loo==TRUE){ fold=size }
  
  last.itr=0
  iseq <- NULL
  for(i in 1:fold){
    len <- (size+i-1) %/%  fold
    iseq[[i]] <- cseq <- (1:len) + last.itr
    last.itr <- tail(cseq,1)
  }
  result <- NULL
  for(i in 1:fold){
    result[[i]] <- list(train = unlist(iseq[-i]),
                        test  = unlist(iseq[ i]))
  }
  result
}


