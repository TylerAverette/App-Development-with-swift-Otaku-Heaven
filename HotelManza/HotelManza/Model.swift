//
//  Model.swift
//  HotelManza
//
//  Created by Student User on 9/25/19.
//  Copyright © 2019 Student User. All rights reserved.
//

import Foundation

struct Registration {
    var firstName: String
    var lastName: String
    var emailAdress: String
    
    var checkInDate: Date
    var checkOutDate: Date
    var numberOfAdults: Int
    var numberOfChildren: Int
    
    var roomType: RoomType
    var wifi: Bool
}

struct RoomType: Equatable{
    var id: Int
    var name: String
    var shortName: String
    var price: Int
    
    static var all: [RoomType]{
        return [RoomType(id: 0, name: "Two Queens", shortName: "2Q", price: 179),
                RoomType(id: 1, name: "One King", shortName: "K", price: 209),
                RoomType(id: 2, name: "Penthouse Suite", shortName: "PHS", price: 309)]
    }
    
    //Equatable protocol implementation for RoomType
    }

func ==(lhs: RoomType, rhs: RoomType) -> Bool{
    return lhs.id == rhs.id
}


