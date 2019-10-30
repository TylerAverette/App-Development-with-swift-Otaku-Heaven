//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by Student User on 8/21/19.
//

import UIKit
import Foundation

class AthleteFormViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var leagueTextField: UITextField!
    @IBOutlet weak var teamTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        // Do any additional setup after loading the view.
    }
    
    var athlete: Athlete?
    
    func updateView(){
        if let athlete = athlete{
            ageTextField.text = athlete.name
            nameTextField.text = athlete.age
            leagueTextField.text = athlete.league
            teamTextField.text = athlete.team
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton){
        guard let name = nameTextField.text,
              let age = ageTextField.text,
              let leauge = leagueTextField.text,
              let team = teamTextField.text
        else{return}
        
        athlete = Athlete(name: name, age: age, league: leauge, team: team)
        performSegue(withIdentifier: "unwindToTable", sender: self)
    }

}
