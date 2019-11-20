//
//  OrderConfirmationViewController.swift
//  Restaurant
//
//  Created by Student User on 11/18/19.
//  Copyright © 2019 Student User. All rights reserved.
//

import UIKit

class OrderConfirmationViewController: UIViewController {

    @IBOutlet weak var timeRemainingLabel: UILabel!
    var minutes: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let minutes = minutes{
            timeRemainingLabel.text = "Thank you for your order! Your wait time is \(minutes) minutes!"
        }
        // Do any additional setup after loading the view.
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
