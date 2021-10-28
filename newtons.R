# Fins the squaerw root of a number
# Duh

sqrt(16)

# Well how else could you do it ? Find a method to do it ?
# NEwton's Method maybe 

target <- 16
tolerance <- 0.0001
guess <- 2

compare <- function(guess,target) {
   diff <- abs((guess^2)-target)  
   return(diff)
}

# You have an original guess - square it and see how close you came
# If it's not close enough then take the target number, divide it by
#the guess, then add it to the guess and then take that number and divide by 2


# Exercise to the student. Write a loop structure to implement this
# First


while( abs((guess^2)-target) >= tolerance) {
  guess <- (guess + (somenum/guess)) * 0.5
}


# This takes a while for them to get.

while(compare(guess,target) >= tolerance) {
  guess <- (guess + (somenum/guess)) * 0.5
}

guess


mySqrt <- function(target,guess,tolerance) {
  while( abs((guess^2)-target) >= tolerance) {
    guess <- (guess + (somenum/guess)) * 0.5
  }
  return(guess)
}