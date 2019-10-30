//
//  AddRegistrationTableViewController.swift
//  HotelManza
//
//  Created by Student User on 9/25/19.
//  Copyright © 2019 Student User. All rights reserved.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController, SelectRoomTypeTableViewControllerDelegate {
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    //Check in / Check Out
    @IBOutlet weak var checkInDateLabel: UILabel!
    @IBOutlet weak var checkInDatePicker: UIDatePicker!
    @IBOutlet weak var checkOutDateLabel: UILabel!
    @IBOutlet weak var checkOutDatePicker: UIDatePicker!
    
    // Collect Numbers
    @IBOutlet weak var numberOfAdultsLabel: UILabel!
    @IBOutlet weak var numberOfAdultsStepper: UIStepper!
    @IBOutlet weak var numberOfChildrenLabel: UILabel!
    @IBOutlet weak var numberOfChildrenStepper: UIStepper!
    
    //Wi-Fi
    @IBOutlet weak var wifiSwitch: UISwitch!
    
    // Room Type Selection
    @IBOutlet weak var roomTypeLabel: UILabel!
    
    let checkInDatePickerCellIndexPath = IndexPath(row: 1, section: 1)
    let checkOutDatePickerCellIndexPath = IndexPath(row: 3, section: 1)
    
    var isCheckInDatePickerShown: Bool = false{
        didSet{
            checkInDatePicker.isHidden = !isCheckInDatePickerShown
        }
    }
    
    var isCheckOutDatePickerShown: Bool = false {
        didSet{
            checkOutDatePicker.isHidden = !isCheckOutDatePickerShown
        }
    }
    
    var roomType:RoomType?
    
    // Conform to Protocol
    func didSelect(roomType: RoomType) {
        self.roomType = roomType
        updateRoomType()
    }
    
    var registration: Registration?{
        
        guard let roomType = roomType else {return nil}
        
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let checkInDate = checkInDatePicker.date
        let checkOutDate = checkOutDatePicker.date
        let numberOfAdults = Int(numberOfAdultsStepper.value)
        let numberOfChildren = Int(numberOfChildrenStepper.value)
        let hasWifi = wifiSwitch.isOn
        //            let roomChoice = roomType.name
        
        return Registration(firstName: firstName,
                            lastName: lastName,
                            emailAdress: email,
                            checkInDate: checkInDate,
                            checkOutDate: checkOutDate,
                            numberOfAdults: numberOfAdults,
                            numberOfChildren: numberOfChildren,
                            roomType: roomType,
                            wifi: hasWifi)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDateViews()
        updateNumberOfGuests()
        updateRoomType()
        
        // This sets the minimum day to register, and declarses today in the min date
        let midnightToday = Calendar.current.startOfDay(for: Date())
        checkInDatePicker.minimumDate = midnightToday
        checkInDatePicker.date = midnightToday
        
    }
    
    func updateNumberOfGuests(){
        numberOfAdultsLabel.text = "\(Int(numberOfAdultsStepper.value))"
        numberOfChildrenLabel.text = "\(Int(numberOfChildrenStepper.value))"
    }
    
    func updateRoomType(){
        if let roomType = roomType{
            roomTypeLabel.text = roomType.name
        } else{
            roomTypeLabel.text = "Not set"
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        updateNumberOfGuests()
    }
    
    @IBAction func wifiSwitchChanged(_ sender: UISwitch) {
    }
    
    func updateDateViews(){
        
        //86400 is the number of seconds in 1 day making checkout min one day past check in date
        checkOutDatePicker.minimumDate = checkInDatePicker.date.addingTimeInterval(86400)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium

        checkInDateLabel.text = dateFormatter.string(from: checkInDatePicker.date)
        checkOutDateLabel.text = dateFormatter.string(from: checkOutDatePicker.date)
    }
    
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        updateDateViews()
    }
    
    //To adjust Hieght
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath{
        case checkInDatePickerCellIndexPath:
            return isCheckInDatePickerShown ? 216 : 0
        case checkOutDatePickerCellIndexPath:
            return isCheckOutDatePickerShown ? 216 : 0
        default:
            return 44.0
        } // end of switch
    }
    
    //To respond to user interaction and dynamically modify row height at runtime
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 1{
            switch (indexPath.row+1){
            case checkInDatePickerCellIndexPath.row:
                if isCheckInDatePickerShown{ //if check in is shown
                    isCheckInDatePickerShown = false
                } else if isCheckOutDatePickerShown{ // if check out is shown
                    isCheckOutDatePickerShown = false
                    isCheckInDatePickerShown = true
                } else{ // if neither date picker is shown
                    isCheckInDatePickerShown = true
                }
                tableView.beginUpdates()
                tableView.endUpdates()
            case checkOutDatePickerCellIndexPath.row:
                if isCheckOutDatePickerShown{  //if check out is shown
                    isCheckOutDatePickerShown = false
                } else if isCheckInDatePickerShown{ // if check in is shown
                    isCheckInDatePickerShown = false
                    isCheckOutDatePickerShown = true
                } else{ // if neither date picker is shown
                    isCheckOutDatePickerShown = true
                }
                tableView.beginUpdates()
                tableView.endUpdates()
            default:
                break
            } // end of switch
        } // end of if
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectRoomType"{
            let destinationViewController = segue.destination as? SelectRoomTypeTableViewController
            
            destinationViewController?.delegate = self
            destinationViewController?.roomType = roomType
        }
    }
    
    @IBAction func cancelButtonTapped(){
        dismiss(animated: true, completion: nil)
    }
    
}
