//
//  ToDo.swift
//  ToDoList
//
//  Created by Student User on 10/9/19.
//  Copyright © 2019 Student User. All rights reserved.
//

import Foundation

//Model
struct ToDo: Codable{
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    
    //implement saving
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURl = DocumentsDirectory.appendingPathComponent("todos").appendingPathExtension("plist")
    
    static func saveToDos(_ toDos: [ToDo]){
        let propertyListEncoder = PropertyListEncoder()
        let codedToDos = try? propertyListEncoder.encode(toDos)
        try? codedToDos?.write(to: ArchiveURl, options: .noFileProtection)
    }
    
    static func loadToDos() -> [ToDo]?{
        guard let codedToDos = try? Data(contentsOf: ArchiveURl) else {return nil}
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode(Array<ToDo>.self, from: codedToDos)
    }
    
    static func loadSampleToDos() -> [ToDo]{
        let todo1 = ToDo(title: "ToDo One", isComplete: false, dueDate: Date(), notes: "Notes 1")
        let todo2 = ToDo(title: "ToDo Two", isComplete: false, dueDate: Date(), notes: "Notes 2")
        let todo3 = ToDo(title: "ToDo Three", isComplete: false, dueDate: Date(), notes: "Notes 3")
        
        return [todo1, todo2, todo3]
    }
    
    static let dueDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
}
