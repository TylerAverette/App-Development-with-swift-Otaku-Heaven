/*:
 ## Exercise - Types and Type Safety
 
 Declare two variables, one called `firstDecimal` and one called `secondDecimal`. Both should have decimal values. Look at both of their types by holding Option and clicking on the variable name.
 */

var firstDecimal = 4.5
var secondDecimal = 5.5
/*:
 Declare a variable called `trueOrFalse` and give it a boolean value. Try to assign it to `firstDecimal` like so: `firstDecimal = trueOrFalse`. Does it compile? Print a statement to the console explaining why not, and remove the line of code that will not compile.
 */
var trueOrFalse = false
//firstDecimal = false
print("The above statement will not compile due to the fact that firstDecimal is of the double type and cannot be assigned a boolean value.")
/*:
 Declare a variable and give it a string value. Then try to assign it to `firstDecimal`. Does it compile? Print a statement to the console explaining why not, and remove the line of code that will not compile.
 */
var hello = "This is a string!"
//firstDecimal = hello
print("The above statement will not compile due to the fact that firstDecimal is of the double type and cannot be assigned a string value.")
/*:
 Finally, declare a variable with a whole number value. Then try to assign it to `firstDecimal`. Why won't this compile even though both variables are numbers? Print a statement to the console explaining why not, and remove the line of code that will not compile.
 */
var number = 32
//firstDecimal = number
print("The above statement will not compile due to the fact that firstDecimal is of the double type and cannot be assigned an integer value that doesn't have decimals.")

//: [Previous](@previous)  |  page 7 of 10  |  [Next: App Exercise - Tracking Different Types](@next)
