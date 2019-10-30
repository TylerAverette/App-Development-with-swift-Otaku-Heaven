//
//  ViewController.swift
//  CommonInputControls
//
//  Created by Student User on 3/7/19.
//  Copyright © 2019 Student User. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userTextFieldA: UILabel!
    @IBOutlet weak var toggleSwitch: UISwitch!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        print("Button was tapped!")
        if toggleSwitch.isOn{
            print("The switch is on!")
        }
        else{
            print("The switch is off!")
        }
        print("The slider is set to \(slider.value)")
    }
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        if sender.isOn{
            print("The switch is on!")
        }
        else{
            print("The switch is off!")
        }
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print(sender.value)
    }
/*
    @IBAction func keyboardReturnKeyTapped(_ sender: UITextField) {
        if let text = sender.text{
            userTextFieldA.text = textField.text
            print(text)
        }
    }
    
    @IBAction func textChanged(_ sender: UITextField) {
        if let text = sender.text{
            print(text)
        }
    }
 */
 
    @IBAction func respondToTapGesture(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        print(location)
    }
}


