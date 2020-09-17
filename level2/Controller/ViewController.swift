//
//  ViewController.swift
//  level2
//
//  Created by Ahmed Shoman on 9/15/20.
//  Copyright © 2020 Ahmed Shoman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - OutLet
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet var buttons: [UIButton]!
   
    //MARK: - Constants
    var firstNumber = 0.0
    var secondNumber = 0.0
    var operationTag = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for button in buttons {
            button.layer.cornerRadius = button.frame.height/2
        }
    }
    //MARK: - IBActions
    @IBAction func buttonsPressed(_ sender: UIButton) {
        switch sender.tag {
          
        case 0...9:
             removeZero()
            resultLabel.text = resultLabel.text! + "\(sender.tag)"
        case 10 :
            checkZero()
        case 18 :
            clearAll()
        case 17 :
            plusMinus()
        case 12...16:
            operationTag = sender.tag
            firstNumber = Double(resultLabel.text!)!
            resultLabel.text = "0"
            
        case 11:
            clacOperation()
        default:
            break
        }
    }
    
    //MARK: - HelperFunction
    func clearAll()  {
        resultLabel.text = "0"
        firstNumber = 0
        secondNumber = 0
    }
    func removeZero()  {
        if resultLabel.text == "0"{
            resultLabel.text = ""
        }
        
    }
    func checkZero() {
        if !resultLabel.text!.contains("."){
            resultLabel.text = resultLabel.text! + "."
        }
    }
    func plusMinus()  {
        if (resultLabel.text?.contains("-"))!{
            resultLabel.text?.removeFirst()
        }else{
         resultLabel.text =  "-" + resultLabel.text!
        }
    }
    func clacOperation()  {
        if operationTag != 0{
            secondNumber = Double(resultLabel.text!)!
            
            switch operationTag {
            case 12:
                resultLabel.text = "\(firstNumber + secondNumber)"
            case 13:
                resultLabel.text = "\(firstNumber - secondNumber)"
            case 14:
                resultLabel.text = "\(firstNumber * secondNumber)"
            case 15:
                resultLabel.text = "\(firstNumber / secondNumber)"
            case 16:
                resultLabel.text = "\(Int(round(firstNumber)) % Int(round(secondNumber)))"
            default:
                break
            }
        }
        firstNumber = 0.0
        secondNumber = 0.0
        operationTag = 0
    }
}

