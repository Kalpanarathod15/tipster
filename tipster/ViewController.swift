//
//  ViewController.swift
//  tipster
//
//  Created by Pranay Gupta on 8/25/14.
//  Copyright (c) 2014 gbven. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
  @IBOutlet var billAmountLabel: UILabel



  @IBOutlet var tipLabel: UILabel

  @IBOutlet var tipAmountLabel: UILabel
  @IBOutlet var totalLabel: UILabel
  @IBOutlet var totalAmountLabel: UILabel

  @IBOutlet var billAmountTextField: UITextField

  @IBOutlet var tipSegmentedControl: UISegmentedControl

  let segmentIndexKey = "selectedSegmentIndex"

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func  viewWillAppear(animated: Bool) {
    var defaults = NSUserDefaults.standardUserDefaults()
    let index = defaults.integerForKey(segmentIndexKey)
    tipSegmentedControl.selectedSegmentIndex = index
    refreshValues()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


  @IBAction func onBillAmountEditingChanged(sender: AnyObject) {
    refreshValues()
  }

  @IBAction func onSegmenterValueChanged(sender: AnyObject) {
    refreshValues()
  }

  func refreshValues() {
    let billAmount = Double((billAmountTextField.text as NSString).doubleValue)
    var tipPct = 0.0
    switch(tipSegmentedControl.selectedSegmentIndex) {
    case 0: tipPct = 0.18
    case 1: tipPct = 0.20
    default: tipPct = 0.25
    }

    let tipAmount = billAmount * tipPct
    let totalAmount = billAmount + tipAmount

    tipAmountLabel.text = "$\(tipAmount)"
    totalAmountLabel.text = "$\(totalAmount)"
  }
}

