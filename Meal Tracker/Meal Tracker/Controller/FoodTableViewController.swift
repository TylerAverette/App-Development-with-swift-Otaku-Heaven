//
//  FoodTableViewController.swift
//  Meal Tracker
//
//  Created by Student User on 8/28/19.
//  Copyright © 2019 Student User. All rights reserved.
//

import UIKit

class FoodTableViewController: UITableViewController {
    var meals: [Meal] {

        let cereal = Food(name: "Cereal", description: "Captain Crunch")
        let poptarts = Food(name: "Pop-Tarts", description: "Wildberry Pop-tarts")
        let pancakes = Food(name: "Pancake", description: "Pancakes with butter and maple syrup")

        let sandwich = Food(name: "Bologna Sandwich", description: "bologna and cheese sandwich")
        let nuggets = Food(name: "Chicken Nuggets", description: "Chicken nuggets with ranch sauce")
        let burger = Food(name: "Bacon Cheeseburger", description: "Bacon cheeseburger with fries")
   
        let pizza = Food(name: "Pizza", description: "Pepperoni Pizza")
        let steak = Food(name: "Steak", description: "T-bone steak")
        let chicken = Food(name: "Chicken Strips", description: "Chicken strips with barbeque sauce")
        
        let breakfast: Meal = Meal(name: "Breakfast", food: [cereal, poptarts, pancakes] )
        let lunch: Meal = Meal(name: "Lunch", food: [sandwich, nuggets, burger] )
        let dinner: Meal = Meal(name: "Dinner", food:[pizza, steak, chicken] )
        
        return [breakfast, lunch, dinner]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let meal = meals[section]
        
        return meal.food.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath)
        let meal = meals[indexPath.section]
        let food = meal.food[indexPath.row]
        
        // Configure the cell...
        cell.textLabel?.text = food.name
        cell.detailTextLabel?.text = food.description

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section].name
    }

}
