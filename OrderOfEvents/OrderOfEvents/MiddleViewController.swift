//
//  SecondViewController.swift
//  OrderOfEvents
//
//  Created by Student User on 4/30/19.
//  Copyright © 2019 Student User. All rights reserved.
//

import UIKit

class MiddleViewController: UIViewController {

    @IBOutlet weak var middleLabel: UILabel!
    var eventNumber = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MiddleViewController - View Did Load")
        
        if let existingText = middleLabel.text{
            middleLabel.text = "\(existingText)\nEventNumber \(eventNumber)"
            eventNumber += 1
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        print("MiddleViewController - View Will Appear")
        if let existingText = middleLabel.text{
            middleLabel.text = "\(existingText)\nEventNumber \(eventNumber)"
            eventNumber += 1
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("MiddleViewController - View Did Appear")
        if let existingText = middleLabel.text{
            middleLabel.text = "\(existingText)\nEventNumber \(eventNumber)"
            eventNumber += 1
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("MiddleViewController - View Will Disappear")
        if let existingText = middleLabel.text{
            middleLabel.text = "\(existingText)\nEventNumber \(eventNumber)"
            eventNumber += 1
        }
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("MiddleViewController - View Did Disappear")
        if let existingText = middleLabel.text{
            middleLabel.text = "\(existingText)\nEventNumber \(eventNumber)"
            eventNumber += 1
        }
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
