//
//  MenuController.swift
//  Restaurant
//
//  Created by Student User on 11/13/19.
//  Copyright © 2019 Student User. All rights reserved.
//
// Notes: URLComponents refors the URL accounting for invalid characters and replaces any spaces with %20
//        components.queryItems returns makes the edits and returns the new URL

import Foundation
import UIKit

// This file will handle all network communication pg.919
class MenuController{
    let baseURL = URL(string: "http://localhost:8090/") //all network calls use the same protocol and host, so you can store it
    static let shared = MenuController()
    static let orderUpdatedNotification = Notification.Name("MenuController.orderUpdated")
    var order = Order(){
        didSet{
            NotificationCenter.default.post(name: MenuController.orderUpdatedNotification, object: nil)
            
        }
    }
    private var itemsByID = [Int:MenuItem]()
    private var itemsByCategory = [String: [MenuItem]]()
    var categories: [String]{
        get{
            return itemsByCategory.keys.sorted()
        }
    }
    static let menuDataUpdatedNotification = Notification.Name("MenuController.menuDataUpdated")

    
    // sends a request to /catgeories // page 924
//    func fetchCategories(completion: @escaping ([String]?) -> Void){
//        let categoryURL = baseURL?.appendingPathComponent("categories")
//
//        let task = URLSession.shared.dataTask(with: categoryURL!) { (data, repsonse, error) in
//            if let data = data,
//                let jsonDictionary = try? JSONSerialization.jsonObject(with: data) as? [String:Any],
//                let categories = jsonDictionary["categories"] as? [String]{
//                    completion(categories)
//            } else{
//                completion(nil)
//            }
//        }
//        task.resume()
//    }
//
//    // sends request to /menu, completion takes in an array of MenuItems
//    func fetchMenuItems(forCategory categoryName: String, completion: @escaping ([MenuItem]?) -> Void){
//        let initialMenuURL = baseURL?.appendingPathComponent("menu")
//        var components = URLComponents(url: initialMenuURL!, resolvingAgainstBaseURL: true)!
//        components.queryItems = [URLQueryItem(name: "category", value: categoryName)]
//        let menuURL = components.url!
//        let jsonDecoder = JSONDecoder()
//
//        let task = URLSession.shared.dataTask(with: menuURL){ (data, response, error) in
//            if let data = data,
//                let menuItems = try? jsonDecoder.decode(MenuItems.self, from: data){
//                completion(menuItems.items)
//            } else{
//                completion(nil)
//            }
//        }
//        task.resume()
//    }
    
    // sends request to /order, will need to include a collection of menu item IDs, takes array of ids, completion returns prepTime pg 920
    func submitOrder(forMenuIDs menuIds: [Int], completion: @escaping (Int?) -> Void){
        guard let orderURL = baseURL?.appendingPathComponent("order") else{return}
        var request = URLRequest(url: orderURL)
        request.httpMethod = "POST"
        request.setValue("applicaiton/json", forHTTPHeaderField: "Content-Type")
        let data: [String: [Int]] = ["menuIds": menuIds] // pg. 923 menuIds is actually menuIDs
        let jsonEncoder = JSONEncoder()
        let jsonData = try? jsonEncoder.encode(data)
        request.httpBody = jsonData
        let jsonDecoder = JSONDecoder()
        
        let task = URLSession.shared.dataTask(with: request){ (data, response, error) in
            if let data = data,
                let preparationTime = try? jsonDecoder.decode(preparationTime.self, from: data){
                completion(preparationTime.prepTime)
            } else{
                completion(nil)
            }
        }
        task.resume()
    }
    
    func fetchImage(url: URL, completion: @escaping (UIImage?) -> Void){
        let task = URLSession.shared.dataTask(with: url){ (data, response, error) in
            if let data = data,
                let image = UIImage(data: data){
                completion(image)
            } else{
                completion(nil)
            }
        }
        task.resume()
    }
    
    func loadOrder(){
        let documentsDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let orderFileURL = documentsDirectoryURL.appendingPathComponent("order").appendingPathExtension("json")
        
        guard let data = try? Data(contentsOf: orderFileURL) else {return}
        order = (try? JSONDecoder().decode(Order.self, from: data)) ?? Order(menuItems: [])
        
    }
    
    func saveOrder(){
        let documentsDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let orderFileURL = documentsDirectoryURL.appendingPathComponent("order").appendingPathExtension("json")
        
        if let data = try? JSONEncoder().encode(order){
            try? data.write(to: orderFileURL)
        }
    }
    
    func item(withID itemID:Int) -> MenuItem?{
        return itemsByID[itemID]
    }
    
    func items(forCategory category: String) -> [MenuItem]?{
        return itemsByCategory[category]
    }
    
    private func process(_ items: [MenuItem]){
        print("process func called")
        itemsByID.removeAll()
        itemsByCategory.removeAll()
        
        print("items")
        for item in items{
            print("\(item)")
            itemsByID[item.id] = item
            itemsByCategory[item.category, default: []].append(item)
        }
        
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: MenuController.menuDataUpdatedNotification, object: nil)
        }
    }
    
    func loadRemoteData(){
        let initialMenuURL = (baseURL?.appendingPathComponent("menu"))!
        let components = URLComponents(url: initialMenuURL, resolvingAgainstBaseURL: true)!
        let menuURL = components.url!

        let task = URLSession.shared.dataTask(with: menuURL){ (data, _, _) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
                let menuItems : MenuItems = try? jsonDecoder.decode(MenuItems.self, from: data){
                self.process(menuItems.items)
            }
            else { print("no data")}
        }
        task.resume()
    }
    
    // Extended Step 1: Pg 965
    func loadItems(){
        let documentsDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let menuItemsFileURL = documentsDirectoryURL.appendingPathComponent("menuItems").appendingPathExtension("json")
        
        guard let data = try? Data(contentsOf: menuItemsFileURL) else{return}
        
        let items = (try? JSONDecoder().decode([MenuItem].self, from: data)) ?? []
        process(items)
    }
    
    // Extended Step 1: pg 965
    func saveItems(){
        let documentsDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let menuItemsFileURL = documentsDirectoryURL.appendingPathComponent("menuItems").appendingPathExtension("json")
        
        let items = Array(itemsByID.values)
        
        if let data = try? JSONEncoder().encode(items){
            try? data.write(to: menuItemsFileURL)
        }
    }
    
}

