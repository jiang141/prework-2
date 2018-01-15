//
//  ViewController.swift
//  tippy
//
//  Created by Ben Lee on 1/11/18.
//  Copyright © 2018 Ben Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lightBlue: UIView!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        
        billField.becomeFirstResponder()

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Tip Calculator"
        let defaults = UserDefaults.standard
        defaults.set(15, forKey: "tip1")
        defaults.set(20, forKey: "tip2")
        defaults.set(30, forKey: "tip3")
        defaults.synchronize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateTip(_ sender: Any) {
        billField.text = billField.text!.replacingOccurrences(of: "$", with: "")

        let defaults = UserDefaults.standard
        
        let tip1: Double = defaults.double(forKey: "tip1")
        let tip2: Double = defaults.double(forKey: "tip2")
        let tip3: Double = defaults.double(forKey: "tip3")

        let tip1Double = tip1/100
        let tip2Double = tip2/100
        let tip3Double = tip3/100

        let tipPercentages = [tip1Double,tip2Double,tip3Double]

        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        print(tipControl.selectedSegmentIndex)
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        billField.text = "$" + billField.text!
    }

    
    
    
    @IBAction func onTap(_ sender: Any) {
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    override func viewWillAppear(_ animated: Bool) {
        billField.becomeFirstResponder()
        let defaults = UserDefaults.standard
        let tip1: Int = defaults.integer(forKey: "tip1")
        let tip2: Int = defaults.integer(forKey: "tip2")
        let tip3: Int = defaults.integer(forKey: "tip3")
        
        let tip1Text: String = String(format: "%d%%", tip1)
        let tip2Text: String = String(format: "%d%%", tip2)
        let tip3Text: String = String(format: "%d%%", tip3)

        
        tipControl.setTitle(tip1Text, forSegmentAt:0)
        tipControl.setTitle(tip2Text, forSegmentAt:1)
        tipControl.setTitle(tip3Text, forSegmentAt:2)
        calculateTip(true)
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.tintAdjustmentMode = .normal
        self.navigationController?.navigationBar.tintAdjustmentMode = .automatic
        print("view will appear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
}

