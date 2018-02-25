## This function creates a special "matrix" object that can cache its inverse.

## Create "place" for inverted matrix 

makeCacheMatrix <- function(x = matrix()) {
inv<-NULL
set<-function(y) {
  x<<-y
  inv<<-NULL
}
get<-function() x
setinverse<-function(solve) inv<<-solve
getinverse<-function() inv
list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## This function computes the inverse of the special "matrix" 

cacheSolve <- function(x, ...) {
  inv<-x$getinverse() 
  if(!is.null(inv)){
    message("getting cached matrix")
    return(inv)
  }
  toinverse<-x$get()
  inv<-solve(toinverse, ...)
  x$setinverse(m)
  inv
        ## Return a matrix that is the inverse of 'x'
}

## CHeck
##> x=matrix(1:4,2,2)
##> x
##[,1] [,2]
##[1,]    1    3
##[2,]    2    4
##> m=makeCacheMatrix(x)
##> cacheSolve(m)
##[,1] [,2]
##[1,]   -2  1.5
##[2,]    1 -0.5
##> cacheSolve(m)
##getting cached matrix
