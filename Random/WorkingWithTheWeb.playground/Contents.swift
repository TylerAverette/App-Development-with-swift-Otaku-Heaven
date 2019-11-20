import UIKit
import PlaygroundSupport


//***************************
//    Extension for section 5
//***************************

extension URL{
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems =
            queries.map { URLQueryItem(name: ($0).0, value: ($0).1) }
            //queries.map { (a,b) in URLQueryItem(name: a, value: b)}
            //queries.map { tuple in URLQueryItem(name: tuple.0, value: tuple.1)}
        return components?.url
    }
}

//map(disctionary){(key, value)}

var p : (Int, Int, String, Double, Int, Int, Int, Double, Int, Int, Int,Int) = (3,5,"Foo", 3.14, 1, 2, 3, 4.5, 1, 2, 3,1)


let t = ("Hello", "Dolly")
func foo( tuple x : (String, String)){
    print(x.0)
    print(x.1)
}
foo( tuple: ("Hello", "Dolly") )


func foo(rectangle: (Int, Int)) -> (Int, Int) {
    return (rectangle.0, rectangle.1)
}



    
PlaygroundPage.current.needsIndefiniteExecution = true
//Line 18 is playgound only, enables the program to wait on a network request and ability to run completion handler.

//***************************
//    Section 1 - Creating a URL and using its properties
//***************************

//let url = URL(string: "https://www.apple.com")
//url?.scheme
//url?.host
//url?.query

//***************************
//    Section 2 - Processing Response
//***************************

//let url = URL(string: "https://www.apple.com")!
//let task = URLSession.shared.dataTask(with: url){ (data, response, error) in
//    if let data = data{
//        print(data)
//    }
//    PlaygroundPage.current.finishExecution() //Playground only, indicates request is finished
//}
//task.resume() // sends the request


//***************************
//    Section 3 - Processing Response as NSData
//***************************

//let url = URL(string: "https://www.apple.com")!
//let task = URLSession.shared.dataTask(with: url){ (data, response, error) in
//    if let data = data{
//        print(data as NSData)
//    }
//    PlaygroundPage.current.finishExecution() //Playground only, indicates request is finished
//}
//task.resume() // sends the request





//***************************
//    Section 4 - Creating an API Request
//***************************

//let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY")!
//let task = URLSession.shared.dataTask(with: url){ (data, response, error) in
//    if let data = data, let string = String(data: data, encoding: .utf8){
//        print(string)
//    }
//    PlaygroundPage.current.finishExecution() //Playground only, indicates request is finished
//}
//task.resume() // sends the request





//***************************
//    Section 5 - Modify a URL with components (Must include extension above)
//***************************

let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!

let query: [String: String] = [
    "api_key": "DEMO_KEY",
    "date": "2011-07-13"
]
let url = baseURL.withQueries(query)!

let task = URLSession.shared.dataTask(with: url,completionHandler: { (data, response, error) in
    if let data = data, let string = String(data: data, encoding: .utf8){
        print(string)
    }
    PlaygroundPage.current.finishExecution() //Playground only, indicates request is finished
})


func dataHandler(data:Data?, response:URLResponse?, error: Error?){
        if let data = data, let string = String(data: data, encoding: .utf8){
            print(string)
        }
        if let response = response {
            print("Response: \(response)");
        }
        if let error = error {
            print("ERROR: \(error)");
        }
        PlaygroundPage.current.finishExecution() //Playground only, indicates request is finished

}

//let task2 = URLSession.shared.dataTask(with: url, completionHandler: dataHandler);

task.resume() // sends the request
