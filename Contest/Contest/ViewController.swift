//
//  ViewController.swift
//  Contest
//
//  Created by Student User on 10/23/19.
//  Copyright © 2019 Student User. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func submitButtonPressed(_ sender: UIButton) {
//        shakeEmailTextField()
//        return
        if let text = emailTextField.text{
            print("[\(text)]")
            if text.isEmpty || text == "" || text.count == 0 {
                print("Shake")
                shakeEmailTextField()
            } else{
                performSegue(withIdentifier: "completionScreenSegue", sender: nil)
            }
        }
    }
    
    func shakeEmailTextField(){
        UIView.animate(withDuration: 0.1, animations: {
            let translationRight = CGAffineTransform(translationX: 10, y: 0)
            self.emailTextField.transform = translationRight
        }) { (_) in
            UIView.animate(withDuration: 0.1, animations: {
                let translationLeft = CGAffineTransform(translationX: -10, y: 0)
                self.emailTextField.transform = translationLeft
            }, completion: { (_) in
                self.emailTextField.transform = CGAffineTransform.identity
            })
            
        }
    }
    
}
