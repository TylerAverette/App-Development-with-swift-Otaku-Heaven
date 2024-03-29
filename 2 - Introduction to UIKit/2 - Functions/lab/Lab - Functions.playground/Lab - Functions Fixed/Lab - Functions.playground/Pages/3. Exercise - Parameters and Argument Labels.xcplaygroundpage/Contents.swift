/*:
 ## Exercise - Parameters and Argument Labels
 
 Write a new introduction function called `introduction`. It should take two `String` parameters, `name` and `home`, and one `Int` parameter, `age`. The function should print a brief introduction. I.e. if "Mary," "California," and 32 were passed into the function, it might print "Mary, 32, is from California." Call the function and observe the printout.
 */

func introduction (name: String, home: String, age: Int){
    print("\(name), is from \(home) and is \(age) years old.")
}
print ("\(introduction(name: "Tyler", home: "Tuscaloosa", age: 24))")
/*:
 Write a function called `almostAddition` that takes two `Int` arguments. The first argument should not require an argument label. The function should add the two arguments together, subtract 2, then print the result. Call the function and observe the printout.
 */
func almostAddition (first: Int,plus second: Int){
    let result = (first + second) - 2
    print("\(result)")
}
print("\(almostAddition(first: 4, plus: 3))")
/*:
 Write a function called `multiply` that takes two `Double` arguments. The function should multiply the two arguments and print the result. The first argument should not require a label, and the second argument should have an external label, "by", that differs from the internal label. Call the function and observe the printout.
 */
func multiply(third: Double, by fourth: Double){
    let mResult = third * fourth
    print("\(mResult)")
}
print("\(multiply(third: 3, by: 4))")

