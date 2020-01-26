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
    @IBOutlet weak var ErrorLabel: UILabel!

    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Get default tip values
        let tipPercentages = defaults.object(forKey:"tipPercentages") as?[Double] ?? [15,18,20]
        //assign values to text fields to diplay current tips
        defaultTipOneField.text = String(tipPercentages[0])
        defaultTipTwoField.text = String(tipPercentages[1])
        defaultTipThreeField.text = String(tipPercentages[2])

    }
    

    @IBAction func updateTipValues(_ sender: Any) {
        //On submit assign percentages values to default values
        if(defaultTipOneField.text?.isEmpty ?? true || defaultTipTwoField.text?.isEmpty ?? true || defaultTipThreeField.text?.isEmpty ?? true){
            ErrorLabel.isHidden = false
        }else{
            let tipPercentages = [
                Double(defaultTipOneField.text!),
                Double(defaultTipTwoField.text!),
                Double(defaultTipThreeField.text!)
            ]

            defaults.set(tipPercentages,forKey: "tipPercentages")
            _ = navigationController?.popViewController(animated: true)
            ErrorLabel.isHidden = true

        }
    }
    
}
