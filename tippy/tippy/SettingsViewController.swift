//
//  SettingsViewController.swift
//  tippy
//
//  Created by Ben Lee on 1/13/18.
//  Copyright © 2018 Ben Lee. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tip1Field: UITextField!
    @IBOutlet weak var tip2Field: UITextField!
    @IBOutlet weak var tip3Field: UITextField!
    
    @IBAction func ChangeDefaults(_ sender: Any) {
        let defaults = UserDefaults.standard
        let tip1Int = Int(tip1Field.text!) ?? 15
        let tip2Int = Int(tip2Field.text!) ?? 20
        let tip3Int = Int(tip3Field.text!) ?? 30

        defaults.set(tip1Int, forKey: "tip1")
        defaults.set(tip2Int, forKey: "tip2")
        defaults.set(tip3Int, forKey: "tip3")
        
        defaults.synchronize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let tip1: Int = defaults.integer(forKey: "tip1")
        let tip2: Int = defaults.integer(forKey: "tip2")
        let tip3: Int = defaults.integer(forKey: "tip3")
        
        tip1Field.text = String(format: "%d", tip1)
        tip2Field.text = String(format: "%d", tip2)
        tip3Field.text = String(format: "%d", tip3)

        
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.tintAdjustmentMode = .normal
        self.navigationController?.navigationBar.tintAdjustmentMode = .automatic
        print("view will appear")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
