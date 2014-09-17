## The two functions below can be used to cache the inverse of a matrix

## This function declares a list of 4 functions and stores are matrix as well as the inverse of the matrix if previously calculated
makeCacheMatrix <- function(x = matrix()) {
    inverse.matrix <- NULL;
    set <- function(y) {
        x <<- y;
        inverse.matrix <<- NULL;
    }
    get <- function() { x; }
    setinv <- function(iy) { inverse.matrix <<- iy; }
    getinv <- function() { inverse.matrix; }
    list(set = set,
         get = get,
         setinv = setinv,
         getinv = getinv);
}

## Return a matrix that is the inverse of 'x'.  Return the cache inverse matrix if it has been previously calculated.
cacheSolve <- function(x, ...) {
    m <- x$getinv()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get();
    m <- solve(data, ...);
    x$setinv(m);
    m;
}
