//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!

    var tip: Int = 0
    var chooseSplit: Int = 2
    var bill: Float = 0.0
    var total: Float = 0.0
    var divTotal: Float = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        switch sender {
        case zeroPctButton:
            zeroPctButton.isSelected = true
            tip = 0
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        case tenPctButton:
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            tip = 10
            twentyPctButton.isSelected = false
        case twentyPctButton:
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            tip = 20
        default:
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        chooseSplit = Int(sender.value)
        splitNumberLabel.text = String(chooseSplit)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let pct = Float(tip)/100.0
        if billTextField.text! == "" {
            bill = 0.0
        }else{
            bill = Float(billTextField.text!)!
        }
        total = bill + pct*bill
        divTotal = total/Float(chooseSplit)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = divTotal
        }
    }
}

