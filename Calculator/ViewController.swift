//
//  ViewController.swift
//  Calculator
//
//  Created by SAMUEL ELBAZ on 1/23/20.
//  Copyright © 2020 SAMUEL ELBAZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onTap(_ sender: Any) {
        print("Hello")
        
        view.endEditing(true)
        
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        //Get bill amount
        let bill = Double(billField.text!) ?? 0
        //calculate the tip and total
        let tipPrecentages = [0.15,0.18,0.2]
        let tip = bill * tipPrecentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        
        //update the tip and total labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f",total)
        
    }
}

