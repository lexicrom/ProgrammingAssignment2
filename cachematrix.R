## These functions will create a special object that stores a 
## matrix and cache its inverse

## this will create a list containing functions to set and get 
## the matrix and to set and get the matrix's inverse 

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setsolve <- function(solve) m <<- solve
        getsolve <- function() m
        list(set = set, get = get, 
             setsolve = setsolve,
             getsolve = getsolve)

}


## this function will calculate the inverse of the matrix created 
## with the above function and store it, but will just get the 
## inverse if it has already been calculated

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getsolve()
        if(!is.null(m)) {
                message("getting cached inverse")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setsolve(m)
        m
}
