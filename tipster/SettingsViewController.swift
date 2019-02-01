//
//  SettingsViewController.swift
//  tipster
//
//  Created by Jose  Davila on 1/26/19.
//  Copyright © 2019 Jose  Davila. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var defaultTipLabel: UILabel!

    @IBOutlet weak var percentageControl: UISegmentedControl!
    
    @IBOutlet weak var currencyLocation: UIPickerView!
    
    let defaults = UserDefaults.standard
    
    var pickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.currencyLocation.delegate = self
        self.currencyLocation.dataSource = self
        
        pickerData = ["USA","UK","France"]
        saveSettings()
    }
    
    @IBAction func defaultTip(_ sender: UISegmentedControl) {
      let currentPercentage = percentageControl.selectedSegmentIndex
        defaults.set(currentPercentage, forKey: "default")
        defaults.set(currentPercentage, forKey: "settingsDefault")
        
        defaults.synchronize()
    }
    
    func saveSettings() {
        let settingsDefault = defaults.integer(forKey: "settingsDefault")
        percentageControl.selectedSegmentIndex = settingsDefault
        
        defaults.synchronize()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
}
