

a simple grey release system base on nginx and lua


assign a certain request parameter that can be a number or a string

then this system will hash a bucket by the certain parameter

you will set a relation map on redis, this is a map of bucket and upstream ( nginx upstream )

example : 
bucket1 -> beta1 
bucket2 -> stable 
bucket3 -> stable 
bucket4 -> stable
...


