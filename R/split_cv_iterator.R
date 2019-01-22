#' @title
#' Generate split iterator pair.
#' 
#' @description
#' Generate split iterator pair from iterator size, sample size or fraction rate.\cr
#' NOTE: Iterator will not be shuffled
#' 
#' @param size [An integer] Data size. Usually NROW(data.frame). 
#' @param n [An integer] sample size. If missing, set n = size * frac.
#' @param frac  [A numeric] fraction rate. Must be between 0 and 1. Default is 0.5.
#' 
#' @examples
#' splitIterator(100, 40)
#' 
#' # The same as above:
#' splitIterator(100, frac=0.4)
#' 
#' @return a list of sampled and remained pair of iterators.
#' @export

splitIterator <- function(size, n, frac = 0.5)
{
  stopifnot(!missing(size))
  if(missing(n)){ n <- as.integer(size * frac) }

  if(n <= 0 | n > size){
    stop("sample size is out of data size")
  }
  
  sampled  <- sort(sample(size, n))
  remained <- (1:size)[-sampled]
  
  list(sample = sampled, remain = remained)
  
}




#' @title
#' Iterator splitting for cross validation
#' @description
#' Iterator splitting for n-fold & leave-one-out (loo) cross validation deviding almost equally sizes of train with test subsets.\cr
#' NOTE: Iterator will not be shuffled
#' @param size [An integer] Number of data, sample size. Usually NROW(data.frame). 
#' @param fold [An integer] Number of folding. If missing, set loo = TRUE.
#' @param loo  [A logical] Default is FALSE. If TRUE, set loo-mode (fold = size).
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

splitIteratorCV <- function(size, fold, loo=FALSE)
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


