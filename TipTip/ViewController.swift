//
//  ViewController.swift
//  TipTip
//
//  Created by YudaiChen on 2020/9/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billField.text!) ?? 0
        //let percentageStr = tipControl.titleForSegment(at: tipControl.selectedSegmentIndex)
        let percentages = [0.15, 0.18, 0.2]
        let tip = bill * percentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipLabel.text = String(format:"$%.2f", tip)
        totalLabel.text = String(format:"$%.2f", total)
    }
}

