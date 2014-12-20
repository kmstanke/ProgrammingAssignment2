## makeCacheMatrix creates a special matrix that can cache its own inverse.

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL       
        setinverse <- function() i <<- solve(x)
        getinverse <- function() i
        list(setinverse = setinverse,
             getinverse = getinverse)        
}
## cacheSolve returns the inverse of the output of makeCacheMatrix using 
## caching when possible.
        
cacheSolve <- function(x, ...) {
        j <- x$getinverse()
        if(!is.null(j)) {
                message("getting cached data")
                return(j)
        }
        x$setinverse()
        x$getinverse()
}
        
        


