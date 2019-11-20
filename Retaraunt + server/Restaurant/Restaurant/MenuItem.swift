//
//  MenuItem.swift
//  Restaurant
//
//  Created by Student User on 11/13/19.
//  Copyright © 2019 Student User. All rights reserved.
//

import Foundation

// Create a model to store the retreived json code pg. 917
struct MenuItem: Codable{
    var id: Int
    var name: String
    var detailText: String
    var price: Double
    var category: String
    var imageURL: URL
    
    enum CodingKeys: String, CodingKey{
        case id
        case name
        case detailText = "description"
        case price
        case category
        case imageURL = "image_url"
    }
}

// Create a model to store an array of the json codes menu
struct MenuItems: Codable{
    let items: [MenuItem]
}
