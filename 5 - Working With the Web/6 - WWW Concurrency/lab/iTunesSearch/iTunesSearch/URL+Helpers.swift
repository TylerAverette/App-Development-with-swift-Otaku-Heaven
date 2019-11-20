//
//  URL+Helpers.swift
//  iTunesSearch
//
//  Created by Student User on 11/4/19.
//  Copyright © 2019 Caleb Hicks. All rights reserved.
//

import Foundation

// This function takes the URL and appends the query
//URLComponents scans the URL to make sure all characters are valid, map then appends the selected query information to the end of the url
extension URL{
    func withQueries(_ queries: [String: String]) -> URL?{
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map
            {URLQueryItem(name:$0.0, value: $0.1)}
        return components?.url
    }
}
