//
//  SettingsViewController.swift
//  tipster
//
//  Created by Pranay Gupta on 8/25/14.
//  Copyright (c) 2014 gbven. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

  @IBOutlet var defaultTipSegmentedControl: UISegmentedControl

  let segmentIndexKey = "selectedSegmentIndex"
  override func viewDidLoad() {
        super.viewDidLoad()
    var defaults = NSUserDefaults.standardUserDefaults()
    let index = defaults.integerForKey(segmentIndexKey)
    defaultTipSegmentedControl.selectedSegmentIndex = index
  }

  override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
  }

  @IBAction func defaultTipValueChanged(sender: AnyObject) {
    var defaults = NSUserDefaults.standardUserDefaults()
    defaults.setInteger(defaultTipSegmentedControl.selectedSegmentIndex, forKey: segmentIndexKey)
    defaults.synchronize()
  }
}
