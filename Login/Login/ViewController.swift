//
//  ViewController.swift
//  Login
//
//  Created by Student User on 4/23/19.
//  Copyright © 2019 Student User. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var forgotUserName: UIButton!
    @IBOutlet weak var forgotPassword: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else {return}
        if sender == forgotUserName{
            segue.destination.navigationItem.title = "Forgot Username"
        }
        else if sender == forgotPassword{
            segue.destination.navigationItem.title = "Forgot Password"
        }
        else{
            segue.destination.navigationItem.title = usernameField.text
        }
    }

    @IBAction func loginAttempt(_ sender: UIButton) {
        var id = "loginSuccess"
        if sender == forgotPassword
            {id = "forgotPasswordSegue"}
        else if sender == forgotUserName
            {id = "forgotUserNameSegue"}
        performSegue(withIdentifier: id, sender: sender)
    }

}

