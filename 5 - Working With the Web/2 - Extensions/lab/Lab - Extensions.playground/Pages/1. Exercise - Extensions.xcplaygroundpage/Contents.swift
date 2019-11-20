/*:
 ## Exercise - Extensions
 
 Define an extension to `Character` that includes a function `isVowel()`. The function returns `true` if the character is a vowel (a,e,i,o,u), and `false` otherwise. Be sure to properly handle uppercase and lowercase characters.
 */
extension Character{
    func isVowel(x: Character) -> Bool{
        if x == "a" || x == "e" || x == "i" || x == "o" || x == "u" ||
           x == "A" || x == "E" || x == "I" || x == "O" || x == "U"{
            return true
        } else {
            return false
        }
    }
}

/*:
 Create two `Character` constants, `myVowel` and `myConsonant`, and set them to a vowel and a consonant, respectively. Use the `isVowel()` methods on each constant to determine whether or not it's a vowel.
 */
let myVowel: Character = "a"
let myConsonant: Character = "g"

myVowel.isVowel(x: myVowel)
myConsonant.isVowel(x: myConsonant)
/*:
 Create a `Rectangle` struct with two variable properties, `length` and `width`, both of type `Double`. Below the definition, write an extension to `Rectangle` that includes a function, `half()`. This function returns a new `Rectangle` instance with half the length and half the width of the original rectangle.
 */
struct Rectangle{
    var length: Double = 40
    var width: Double = 40
}

extension Rectangle{
    func half() -> Rectangle{
        let newRectagle = Rectangle(length: length/2, width: width/2)
        return newRectagle
    }
}
/*:
 Within the existing `Rectangle` extensions, add a new mutating function, `halved()`, which updates the original rectangle to have half the length and half the width. Use the `half()` function as part of the implementation for `halved()`.
 */
extension Rectangle{
    mutating func halved(){
        let r = self.half()
        self.length = r.length
        self.width = r.width
        
    }
}

/*:
 Create a variable `Rectangle` called `myRectangle`, and set its length to 10 and its width to 5. Create a second instance, `mySmallerRectangle`, that's the result of calling `half()` on `myRectangle`. Then update the values of `myRectangle` by calling `halved()` on itself. Print each of the instances.
 */

var myRectangle = Rectangle(length: 10, width: 5)
let mySmallerRectangle = myRectangle.half()
myRectangle.halved()
//: page 1 of 2  |  [Next: App Exercise - Workout Extensions](@next)
