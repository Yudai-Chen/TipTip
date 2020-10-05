//
//  SettingsViewController.swift
//  TipTip
//
//  Created by YudaiChen on 2020/10/5.
//

import UIKit

class SettingsViewController: UITableViewController {

    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextField!
    @IBOutlet weak var text3: UITextField!
    @IBOutlet weak var nightModeSwitch: UISwitch!
    let defaultStand = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateView()
    }
    
    @IBAction func onNightModeChange(_ sender: Any) {
        defaultStand.set(nightModeSwitch.isOn, forKey: "isNightMode")
        updateView()
    }
    
    @IBAction func onChange1(_ sender: Any) {
        defaultStand.set(text1.text, forKey: PercentageInfo.first)
        
    }
    
    @IBAction func onChange2(_ sender: Any) {
        defaultStand.set(text2.text, forKey: PercentageInfo.second)
    }
    
    @IBAction func onChange3(_ sender: Any) {
        defaultStand.set(text3.text, forKey: PercentageInfo.third)
    }
    
    func updateView() {
        nightModeSwitch.setOn(defaultStand.bool(forKey: "isNightMode"), animated: true)
        text1.text = String(defaultStand.integer(forKey: PercentageInfo.first))
        text2.text = String(defaultStand.integer(forKey: PercentageInfo.second))
        text3.text = String(defaultStand.integer(forKey: PercentageInfo.third))
        view.overrideUserInterfaceStyle = defaultStand.bool(forKey: "isNightMode") ? .dark : .light
    }
}
