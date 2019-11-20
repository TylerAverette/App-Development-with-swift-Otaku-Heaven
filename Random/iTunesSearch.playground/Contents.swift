import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

// This extension edits the URL with queries given to it and returns the new URL
// Linea 11-12 appends steve jobs and ebook to the url, queries.map appends the entire key/value pair for arguments 1 and 2 in query
extension URL{
    func withQueries(_ queries: [String: String]) -> URL?{
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map
            {URLQueryItem(name:$0.0, value: $0.1)}
        return components?.url
    }
}

let query: [String: String] = [
    "term": "steve jobs",
    "media": "software",
    "entity": "movieArtist"
]
let baseURL = URL(string: "https://itunes.apple.com/search")!
let url = baseURL.withQueries(query)!

let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    if let data = data, let string = String(data: data, encoding: .utf8){
        print(string)
    }
    PlaygroundPage.current.finishExecution()
}

task.resume()
