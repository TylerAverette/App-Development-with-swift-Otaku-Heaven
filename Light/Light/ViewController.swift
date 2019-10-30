//
//  ViewController.swift
//  Light
//
//  Created by Student User on 1/31/19.
//  Copyright © 2019 Tyler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var lightOn  = true
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        lightOn = !lightOn
        updateUI()
    }
    func updateUI(){
        view.backgroundColor = lightOn ? .white : .black
    }
}

