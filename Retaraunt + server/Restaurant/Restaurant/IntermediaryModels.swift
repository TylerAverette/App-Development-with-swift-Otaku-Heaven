//
//  IntermediaryModels.swift
//  Restaurant
//
//  Created by Student User on 11/13/19.
//  Copyright © 2019 Student User. All rights reserved.
//

import Foundation

// The API can return a list of categories as a string array, make an object to store them in. pg.917-918
struct Categories{
    var categories: [String]
}

// /order endpoint, use cutom keys to get rid of underscore needed for JSON info pg.918
struct preparationTime: Codable{
    let prepTime: Int
    
    enum CodingKeys: String, CodingKey{
        case prepTime = "preparation_time"
    }
}
