//
//  GlucoseThresholdTableViewController.swift
//  Loop
//
//  Created by Pete Schwamb on 1/1/17.
//  Copyright © 2017 LoopKit Authors. All rights reserved.
//

import Foundation

import UIKit
import LoopKitUI
import HealthKit


final class GlucoseThresholdTableViewController: TextFieldTableViewController {
    
    public let glucoseUnit: HKUnit
    
    init(threshold: Double?, glucoseUnit: HKUnit) {
        self.glucoseUnit = glucoseUnit
        
        super.init(style: .grouped)
        
        placeholder = NSLocalizedString("Enter suspend threshold", comment: "The placeholder text instructing users to enter a suspend treshold")
        keyboardType = .decimalPad
        contextHelp = NSLocalizedString("When current or forecasted glucose is below the suspend threshold, Loop will not recommend a bolus, and will always recommend a temporary basal rate of 0 units per hour.", comment: "Explanation of suspend threshold")
        
        unit = glucoseUnit.localizedShortUnitString

        if let threshold = threshold {
            value = NumberFormatter.glucoseFormatter(for: glucoseUnit).string(from: threshold)
        }

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

final class MaximumIOBTableViewController: TextFieldTableViewController {
    
   // public let maximumIOB: Double
    
    init(maximumIOB: Double?) {
        //self.maximumIOB = (maximumIOB)!
        
        
        super.init(style: .grouped)
        
        placeholder = NSLocalizedString("Enter Maximum Correction IOB (U)", comment: "The placeholder text instructing users to enter a maximum correction IOB")
        keyboardType = .decimalPad
        contextHelp = NSLocalizedString("Maximum Allowable IOB (U) to Still Perform Positive Insulin Corrections.  Reductions of Insulin Rate From Scheduled Basal Rate Are Unaffected by This Setting. Setting This to a High Value Lets Loop Correct As The Algorithm Sees Fit - ie Add As Much Insulin as Necessary to Correct Blood Glucose.  Setting This Parameter to Zero Puts Loop in Predictive Glucose Suspend Mode Only.  Setting It At A Low Value Will Only Allow Loop To Add More Insulin Until IOB Reaches This Value, Regardless of How IOB Was Received (Thru Boluses or Basals).  Boluses Are Unaffected by This Parameter.", comment: "Explanation of maximum IOB")
        
        //unit = glucoseUnit.localizedShortUnitString
        
        if let maximumIOB = maximumIOB {
            //value = NumberFormatter.glucoseFormatter(for: glucoseUnit).string(from: threshold)
            value = String(format:"%.1f", maximumIOB)
            //value = valueNumberFormatter.string(from: maximumIOB, unit: "U")
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
