/*:
 ## Exercise - Adopt Protocols: CustomStringConvertible, Equatable, and Comparable
 
 Create a `Human` class with two properties: `name` of type `String`, and `age` of type `Int`. You'll need to create a memberwise initializer for the class. Initialize two `Human` instances.
 */
class Human: CustomStringConvertible, Equatable, Comparable, Codable{
    let name: String
    var age: Int
    
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
    
    var description: String{
        return "Name: \(name), Age: \(age)"
    }
    
    static func ==(lhs: Human, rhs: Human) -> Bool{
        return lhs.name == rhs.name && lhs.age == rhs.age
    }
    
    static func < (lhs: Human, rhs: Human) -> Bool{
        return lhs.age < rhs.age
    }
}

let personOne = Human(name: "Johnny", age: 22)
let personTwo = Human(name: "Nicole", age: 18)
/*:
 Make the `Human` class adopt the `CustomStringConvertible`. Print both of your previously initialized `Human` objects.
 */
print(personOne)
print(personTwo)
/*:
 Make the `Human` class adopt the `Equatable` protocol. Two instances of `Human` should be considered equal if their names and ages are identical to one another. Print the result of a boolean expression evaluating whether or not your two previously initialized `Human` objects are equal to eachother (using `==`). Then print the result of a boolean expression evaluating whether or not your two previously initialized `Human` objects are not equal to eachother (using `!=`).
 */
print(personOne == personTwo)
print(personOne != personTwo)
/*:
 Make the `Human` class adopt the `Comparable` protocol. Sorting should be based on age. Create another three instances of a `Human`, then create an array called `people` of type `[Human]` with all of the `Human` objects that you have initialized. Create a new array called `sortedPeople` of type `[Human]` that is the `people` array sorted by age.
 */
let personThree = Human(name: "Jeremy", age: 25)
let personFour = Human(name: "Daequan", age: 16)
let personFive = Human(name: "kazume", age: 32)

let people: [Human] = [personOne, personTwo, personThree, personFour, personFive]
let sortedPeople: [Human] = people.sorted(by: <)

for Human in sortedPeople{
    print(Human)
}
/*:
 Make the `Human` class adopt the `Codable` protocol. Create a `JSONEncoder` and use it to encode as data one of the `Human` objects you have initialized. Then use that `Data` object to initialize a `String` representing the data that is stored, and print it to the console.
 */
import Foundation

let jsonEncoder = JSONEncoder()
if let jsonData = try? jsonEncoder.encode(personOne), let jsonString = String(data:jsonData, encoding: .utf8){
    print(jsonString)
}


//: page 1 of 5  |  [Next: App Exercise - Printable Workouts](@next)
