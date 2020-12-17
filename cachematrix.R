## i use two functions. In the first one i build a list of 4 functions
## that are related to a matrix.

## The principal condition is that the matrix must be cuadratic and have determinant


makeCacheMatrix <- function(x = matrix()) {
      inverse <- NULL
      set_matrix <- function(y) {
            x <<- y
            inverse <<- NULL
      }
      get_matrix <- function() x
      set_inverse <- function(mean) inverse <<- mean
      get_inverse <- function() inverse
      list(set_matrix = set_matrix, get_matrix = get_matrix,
           set_inverse = set_inverse,
           get_inverse = get_inverse)
}


## With this function we can calculate the inverse of a matrix and take advantage about the cache or lexical scoping of R. 

cacheSolve <- function(x) {
      inverse <- x$get_inverse()
      if(!is.null(inverse)) {
            message("getting cached data")
            return(inverse)
      }
      data <- x$get_matrix()
      inverse <- solve(data)
      x$set_inverse(inverse)
      inverse  
      ## Return a matrix that is the inverse of 'x'
}


