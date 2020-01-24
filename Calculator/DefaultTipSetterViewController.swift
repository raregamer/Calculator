//
//  DefaultTipSetterViewController.swift
//  Calculator
//
//  Created by Samuel Elbaz on 1/24/20.
//  Copyright © 2020 SAMUEL ELBAZ. All rights reserved.
//

import UIKit

class DefaultTipSetterViewController: UIViewController {


    @IBOutlet weak var defaultTipOneField: UITextField!
    @IBOutlet weak var defaultTipTwoField: UITextField!
    @IBOutlet weak var defaultTipThreeField: UITextField!
    @IBOutlet weak var defaultTipDoneButton: UIButton!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func updateTipValues(_ sender: Any) {
        if(defaultTipOneField.text?.isEmpty ?? true || defaultTipTwoField.text?.isEmpty ?? true || defaultTipThreeField.text?.isEmpty ?? true){
            print("All fields required")
        }else{
            let tipPercentages = [
                Double(defaultTipOneField.text!),
                Double(defaultTipTwoField.text!),
                Double(defaultTipThreeField.text!)
            ]

            defaults.set(tipPercentages,forKey: "tipPercentages")

        }
    }
    
}
