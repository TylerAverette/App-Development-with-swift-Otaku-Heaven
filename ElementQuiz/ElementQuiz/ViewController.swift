//
//  ViewController.swift
//  ElementQuiz
//
//  Created by Student User on 10/22/19.
//  Copyright © 2019 Student User. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var answerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       updateElement()
        // Do any additional setup after loading the view.
    }
let elementList = ["Carbon", "Gold", "Chlorine", "Sodium"]
var currentElementIndex = 0
    func updateElement () {
        answerLabel.text = "?"
        let elementName = elementList[currentElementIndex]
        let image = UIImage(named: elementName)
        imageView.image = image
    }

    
    
    @IBAction func showAnswer(_ sender: Any) {
        answerLabel.text = elementList[currentElementIndex]    }
  
    
    
    @IBAction func gotoNextElement(_ sender: Any) {
    currentElementIndex += 1
        if currentElementIndex >= elementList.count {
                currentElementIndex = 0
        }
        updateElement()
    }
    
}

