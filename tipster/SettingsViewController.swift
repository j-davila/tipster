//
//  SettingsViewController.swift
//  tipster
//
//  Created by Jose  Davila on 1/26/19.
//  Copyright © 2019 Jose  Davila. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var defaultTipLabel: UILabel!

    @IBOutlet weak var percentageControl: UISegmentedControl!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
}
