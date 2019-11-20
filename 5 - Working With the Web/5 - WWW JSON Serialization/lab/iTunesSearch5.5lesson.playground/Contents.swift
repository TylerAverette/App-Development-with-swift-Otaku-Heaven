import UIKit
import PlaygroundSupport

// Part One: HTTP, URLs, and URL Session

PlaygroundPage.current.needsIndefiniteExecution = true

struct PhotoInfo: Codable{
    var title: String
    var description: String
    var url: URL
    var copyright: String?

    enum CodingKeys: String, CodingKey{ // This enum handles cases where your key name is different from the key needed for the api.
        case title
        case description = "explanation"
        case url
        case copyright
    }

    init(from decoder: Decoder) throws{
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try valueContainer.decode(String.self, forKey: CodingKeys.title)
        self.description = try valueContainer.decode(String.self, forKey: CodingKeys.description)
        self.url = try valueContainer.decode(URL.self, forKey: CodingKeys.url)
        self.copyright = try valueContainer.decode(String.self, forKey: CodingKeys.copyright)
    }
}

extension URL {

    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}

//let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
//
//let query: [String: String] = [
//    "api_key": "DEMO_KEY"
//]
//
//let url = baseURL.withQueries(query)!
//
//URLSession.shared.dataTask(with: url) { (data, response, error) in
//    let jsonDecoder = JSONDecoder()
//    if let data = data,
//        let photoInfo = try? jsonDecoder.decode(PhotoInfo.self, from: data) {
//        print(photoInfo)
//    }
//    PlaygroundPage.current.finishExecution()
//}.resume()


func foo(f:()->()){}
func foo(g:()->Void){}
func foo(){}
var f : ()->() = {}
var g : ()->Void = foo
var h : () = () {
    didSet {
        
    }
}
var i : Void = ()
g = f
f = g

typealias nothing = ()
func foobar()->nothing {}

foo(f: f)
foo(g: f)
foo(f: foo)
foo(g: {})


h = ()
h = i
h = {print("dumb")}()
h = foo()
h = g()
h = f()







func h2(){
    
}

func fetchPhotoInfo(completion: @escaping (PhotoInfo?) -> Void ){
    let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
    let query: [String: String] = [
        "api_key": "DEMO_KEY",
    ]
    let url = baseURL.withQueries(query)!
    let task = URLSession.shared.dataTask(with: url){ (data, response, error) in
        //let jsonDecoder = JSONDecoder()
        if let data = data,
            let photoInfo = try? JSONDecoder().decode(PhotoInfo.self, from: data){
                completion(photoInfo)
        } else {
            print("Either no data was returned, or data was not decoded.")
            completion(nil)
        }
        PlaygroundPage.current.finishExecution()
    }
    task.resume()
}
fetchPhotoInfo(completion:)

fetchPhotoInfo { (fetchedInfo) in
    print(fetchedInfo)
}
//Questions:
//1. Why do you need to create an instance of jsonDecoder?
//2. Why does the void return type go inside fo the parenthesis?
/*:

 _Copyright © 2018 Apple Inc._

 _Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:_

 _The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software._

 _THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE._
 */
