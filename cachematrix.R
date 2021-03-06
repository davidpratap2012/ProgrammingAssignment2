## The following two functions are written to cache the inverse of a matrix 
## rather than compute it repeatedly

## The first function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  set<-function(y){
    x<<-y
    m<<-NULL
  }
  get<-function()x
  setinverse<-function(solve) m<<-solve
  getinverse<-function()m
  list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}


## This second function below computes the inverse of the "special" matrix 
## returned by makeCacheMatrix above. If the inverse has already been calculated 
## (and the matrix unchanged) then the cacheSolve should retrieve the inverse from the cache
cacheSolve <- function(x, ...) {
  
  m<-x$getinverse()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  data<-x$get()
  m<-solve(data,...)
  x$setinverse(m)
  m
}
