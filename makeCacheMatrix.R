makeCacheMatrix <- function(x = numeric()) {
  inverseValueMatrix <- NULL
  set <- function(y) {
    x <<- y
    inverseValueMatrix <<- NULL
  }
  
  get <- function() x
  
  setInverse <- function(inverseValue) inverseValueMatrix <<- inverseValue

  
  getInverse <- function() inverseValueMatrix
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

cacheSolve <- function(x) {
  inverseValueMatrix <- x$getInverse()
  if (!is.null(inverseValueMatrix)) {
    return (inverseValueMatrix)
  }
  myMatrix <- x$get()
  aux <- solve(myMatrix)
  x$setInverse(aux)
  aux
}