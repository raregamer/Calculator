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
        super.viewDidAppear(animated)
            self.tipPercentages = defaults.object(forKey:"tipPercentages") as?[Double] ?? [0.15,0.18,0.2]

        for(index, value) in tipPercentages.enumerated(){
            print(value, index)
            tipControl.setTitle(String(format: "%.2f" , value), forSegmentAt: index)
        }
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
        
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        //Get bill amount
        let bill = Double(billField.text!) ?? 0
        //calculate the tip and total
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        
        //update the tip and total labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f",total)
        
    }
}

