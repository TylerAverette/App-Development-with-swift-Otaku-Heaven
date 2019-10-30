/*:
 ## App Exercise - Activity Challenge
 
 >These exercises reinforce Swift concepts in the context of a fitness tracking app.
 
 Your fitness tracking app shows users a list of possible challenges, grouped by activity type (i.e. walking challenges, running challenges, calisthenics challenges, weightlifting challenges, etc.) A challenge could be as simple as "Walk 3 miles a day" or as intense as "Run 5 times a week." 
 
 Using arrays of type `String`, create at least two lists, one for walking challenges, and one for running challenges. Each should have at least two challenges and should be initialized using an array literal. Feel free to create more lists for different activities.
 */
var walkingChallenges = ["Walk 1 day", "Walk 2 days"]
var runningChallenges = ["Run 1 mile", "Run 10 miles"]

/*:
 In your app you want to show all of these lists on the same screen grouped into sections. Create a `challenges` array that holds each of the lists you have created (it will be an array of arrays). Using `challenges`, print the first element in the second challenge list.
 */
var challenges = [walkingChallenges + runningChallenges]
print(challenges[0][2])


/* Dr. Yessick's work
 var all = walkingChallenges
 all += runningChallenges
 
 var challenges = [all, walkingChallenges, runningChallenges]
 
 
 print(challenges[0][2])
 let elts = challenges[0] //4 elements
 let wc = challenges[1] //walking challenges array
 let rc = challenges[2] //running challenges array
 wc[0]
 
 
 
 
 
 var eg1 = walkingChallenges
 var eg2 = walkingChallenges + runningChallenges
 var eg3 = [walkingChallenges]
 var eg4 = [walkingChallenges + runningChallenges]
 var eg5 = [walkingChallenges, runningChallenges] */
/*:
 Create a new array of type `String` that will represent challenges a user has committed to instead of available challenges. It can be an empty array or have a few items in it.
 */
challenges.removeAll()

/*:
 Write an if statement that will use `isEmpty` to check if there is anything in the array. If there is not, print a statement asking the user to commit to a challenge. Add an else-if statement that will print "The challenge you have chosen is <INSERT CHOSEN CHALLENGE>" if the array count is exactly 1. Then add an else statement that will print "You have chosen multiple challenges."
 */


if challenges.isEmpty{
    print("Please commit to a challenge")
}
else if(challenges.count == 1){
    print("The challenge you have chosen is \(challenges[0])")
}
else{
    print("You have chosen multiple challenges!")
}
//: [Previous](@previous)  |  page 2 of 4  |  [Next: Exercise - Dictionaries](@next)
