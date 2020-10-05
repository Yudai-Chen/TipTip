//
//  ViewController.swift
//  TipTip
//
//  Created by YudaiChen on 2020/9/30.
//

import UIKit

struct PercentageInfo {
    static let first = "first"
    static let second = "second"
    static let third = "third"
}

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel1: UILabel!
    @IBOutlet weak var totalLabel2: UILabel!
    @IBOutlet weak var totalLabel3: UILabel!
    @IBOutlet weak var totalLabel4: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        setTipControlTitlesProcedure()
        let defaultStand = UserDefaults.standard
        view.overrideUserInterfaceStyle = defaultStand.bool(forKey: "isNightMode") ? .dark : .light
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTipControlTitlesProcedure()
        calculateTipProcedure()
        let defaultStand = UserDefaults.standard
        view.overrideUserInterfaceStyle = defaultStand.bool(forKey: "isNightMode") ? .dark : .light
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        calculateTipProcedure()
    }
    
    func setTipControlTitlesProcedure() {
        let defaultStand = UserDefaults.standard
        tipControl.setTitle(String(defaultStand.integer(forKey: PercentageInfo.first)) + "%", forSegmentAt:0)
        tipControl.setTitle(String(defaultStand.integer(forKey: PercentageInfo.second)) + "%", forSegmentAt:1)
        tipControl.setTitle(String(defaultStand.integer(forKey: PercentageInfo.third)) + "%", forSegmentAt:2)
    }
    
    func calculateTipProcedure() {
        let bill = Double(billField.text!) ?? 0
        let defaultStand = UserDefaults.standard
        let percentages = [Double(defaultStand.integer(forKey: PercentageInfo.first)) / 100,
                           Double(defaultStand.integer(forKey: PercentageInfo.second)) / 100,
                           Double(defaultStand.integer(forKey: PercentageInfo.third)) / 100]
        let tip = bill * percentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipLabel.text = String(format:"$%.2f", tip)
        totalLabel1.text = String(format:"$%.2f", total)
        totalLabel2.text = String(format:"$%.2f", total/2)
        totalLabel3.text = String(format:"$%.2f", total/3)
        totalLabel4.text = String(format:"$%.2f", total/4)
    }
}

