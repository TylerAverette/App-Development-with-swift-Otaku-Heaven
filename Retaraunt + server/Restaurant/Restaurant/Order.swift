//
//  Order.swift
//  Restaurant
//
//  Created by Student User on 11/13/19.
//  Copyright © 2019 Student User. All rights reserved.
//

import Foundation

// The order model will contain a simple list of items the user has added. pg 918
struct Order: Codable{
    var menuItems: [MenuItem]
    
    init(menuItems: [MenuItem] = []){
        self.menuItems = menuItems
    }
}
