/*:
 ## Exercise - Create Functions
 
 Write a function called `introduceMyself` that prints a brief introduction of yourself. Call the funtion and observe the printout.
 */

func introduceMyself (_ introduction: String){
    print("\(introduction)")
}
/*:
 Write a function called `magicEightBall` that generates a random number and then uses either a switch statement or if-else-if statements to print different responses based on the random number generated. `let randomNum = arc4random_uniform(UInt32(5))` will generate a random number from 0 to 4, after which you can print different phrases corresponding to the number generated. Call the function multiple times and observe the different printouts. Note that the random number generation will not work unless your function is declared after the `import Foundation` statement below. This is because the `arc4random_uniform(_:)` function is declared in the `Foundation` framework.
 */
import Foundation
let randomNum = arc4random_uniform(UInt32(5))

switch randomNum{
case 0: print("Your result is: 0")
case 1: print("Your result is: 1")
case 2: print("Your result is: 2")
case 3: print("Your result is: 3")
case 4: print("Your result is: 4")
default: print("Programatic Failure")
}
//: page 1 of 6  |  [Next: App Exercise - A Functioning App](@next)
