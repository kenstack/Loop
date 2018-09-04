//
//  MaximumIOBTableViewController.swift
//  Loop
//
//  Created by Kenneth Stack on 9/3/18.
//  Copyright © 2018 LoopKit Authors. All rights reserved.
//

import Foundation
import UIKit
import LoopKitUI
import HealthKit

final class MaximumIOBTableViewController: TextFieldTableViewController {
    
    
    
    init(maximumIOB: Double?) {
 
        super.init(style: .grouped)
        
        placeholder = NSLocalizedString("Enter Maximum Correction IOB (U)", comment: "The placeholder text instructing users to enter a maximum correction IOB")
        keyboardType = .decimalPad
        contextHelp = NSLocalizedString("Maximum Allowable IOB (U) to Still Perform Positive Insulin Corrections.  Reductions of Insulin Rate From Scheduled Basal Rate Are Unaffected by This Setting. Setting This to a High Value Lets Loop Correct As The Algorithm Sees Fit - ie Add As Much Insulin as Necessary to Correct Blood Glucose.  Setting This Parameter to Zero Puts Loop in Predictive Glucose Suspend Mode Only.  Setting It At A Low Value Will Only Allow Loop To Add More Insulin Until IOB Reaches This Value, Regardless of How IOB Was Received (Thru Boluses or Basals).  Boluses Are Unaffected by This Parameter.", comment: "Explanation of maximum IOB")
        
        
        if let maximumIOB = maximumIOB {
            value = String(format:"%.1f", maximumIOB)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

