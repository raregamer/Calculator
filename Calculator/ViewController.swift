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
    let defaults = UserDefaults.standard
    var tipPercentages = [Double]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
            self.tipPercentages = defaults.object(forKey:"tipPercentages") as?[Double] ?? [15,18,20]

        for(index, value) in tipPercentages.enumerated(){
//            set title string of percent values
            tipControl.setTitle(String(format: "%.0f%%" , value), forSegmentAt: index)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("in here")
        billField.becomeFirstResponder()
    }
    

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
        
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        //Get bill amount
        let bill = Double(billField.text!) ?? 0
        //calculate the tip and total
        let tip = bill * (tipPercentages[tipControl.selectedSegmentIndex]/100)
        let total = bill + tip
        
        
        //update the tip and total labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f",total)
        
    }
}

