//
//  MenuTableViewController.swift
//  Restaurant
//
//  Created by Student User on 11/13/19.
//  Copyright © 2019 Student User. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {

    var menuItems = [MenuItem]()
    var category: String?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Menu did load")
        NotificationCenter.default.addObserver(self, selector: #selector(updateUI), name: MenuController.menuDataUpdatedNotification, object: nil)
        updateUI()
//        title = category.capitalized
//        MenuController.shared.fetchMenuItems(forCategory: category){ (menuItems) in
//            if let menuItems = menuItems{
//                self.updateUI(with: menuItems)
//            }
//        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
//    func updateUI(with menuItems: [MenuItem]){
//
//        DispatchQueue.main.async {
//            self.menuItems = menuItems
//            self.tableView.reloadData()
//        }
//    }
    
    @objc func updateUI(){
        guard let category = category else {return}
        title = category.capitalized
        menuItems = MenuController.shared.items(forCategory: category) ?? []
        self.tableView.reloadData()
    }
    
    func configure(_ cell: UITableViewCell, forItemAt indexPath: IndexPath){
        let menuItem = menuItems[indexPath.row]
        cell.textLabel?.text = menuItem.name
        // the %.2f formats the output to two digits of percision
        cell.detailTextLabel?.text = /*"$\(menuItem.price)"*/ String(format: "$%.2f", menuItem.price)
        MenuController.shared.fetchImage(url: menuItem.imageURL){ (image) in
            guard let image = image else{return}
            DispatchQueue.main.async {
                if let currentIndexPath = self.tableView.indexPath(for: cell),
                    currentIndexPath != indexPath{
                    return
                }
            }
            cell.imageView?.image = image
            print("Helllo \(menuItem.name)")
            cell.setNeedsLayout()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MenuDetailSegue"{
            let menuItemDetailViewController = segue.destination as! MenuItemDetailViewController
            let index = tableView.indexPathForSelectedRow!.row
            menuItemDetailViewController.menuItem = menuItems[index]
        }
    }
    
    override func encodeRestorableState(with coder: NSCoder) {
        super.encodeRestorableState(with: coder)
        
        guard let category = category else{return}
        
        coder.encode(category, forKey: "category")
    }
    
    override func decodeRestorableState(with coder: NSCoder) {
        super.decodeRestorableState(with: coder)
        
        category = coder.decodeObject(forKey: "category") as? String
        updateUI()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        print("s1")
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCellIdentifier", for: indexPath)

        // Configure the cell...
        configure(cell, forItemAt: indexPath)
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
