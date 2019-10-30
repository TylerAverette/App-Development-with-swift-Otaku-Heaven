//
//  ViewController.swift
//  FinalExamSwift1
//
//  Created by Student User on 5/2/19.
//  Copyright © 2019 Student User. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftOperandTextField: UITextField!
    @IBOutlet weak var operationTextField: UITextField!
    @IBOutlet weak var rightOperandTextField: UITextField!
    @IBOutlet weak var resultTextField: UITextField!
    
    var workingOperator: Operations? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
        
        enum Operations{
            case plus, minus, times
            
            static func get(_ myOperator:String)-> Operations?{
                switch myOperator.lowercased(){
                case "plus":
                    return .plus
                case "minus":
                    return .minus
                case "times":
                    return .times
                default:
                    return nil
                }
            } // get end
            
            func perform(leftOperand: Double, rightOperand: Double) -> Double{
                switch self{
                case .plus:
                    return leftOperand + rightOperand
                case .minus:
                     return leftOperand - rightOperand
                case .times:
                     return leftOperand * rightOperand
                }
            } // perform end
        }// enum end

    
    @IBAction func reset(_ sender: UIButton) {
        leftOperandTextField.text = ""
        rightOperandTextField.text = ""
        operationTextField.text = ""
        resultTextField.text = "Ready"
        resultTextField.textColor = .black
    }
    
    @IBAction func compute(_ sender: UIButton) {
        if let workingOperator = Operations.get(operationTextField.text!){
            if let leftOperand = Double(leftOperandTextField.text!){
                if let rightOperand = Double(rightOperandTextField.text!){
                    resultTextField.text = String(workingOperator.perform(leftOperand: leftOperand, rightOperand: rightOperand))
                }
                else{
                    rightOperandTextField.placeholder = "Right Operand"
                    resultTextField.text = "Error"
                }
            }
            else{
                leftOperandTextField.placeholder = "Left Operand"
                resultTextField.text = "Error"
            }
        }
        else{
            operationTextField.text = "operand"
            resultTextField.text = "Error"
            resultTextField.textColor = .red
        }
        if let result = Double(resultTextField.text!) {
            if result < 0{
                resultTextField.textColor = .red
            }
            else{
                resultTextField.textColor = .black
            }
        }
    }//end compute
}//end program

