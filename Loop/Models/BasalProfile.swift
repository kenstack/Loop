//
//  BasalProfile.swift
//  Loop
//
//  Created by Kenneth Stack on 2/14/18.
//  Copyright © 2018 LoopKit Authors. All rights reserved.
//

import Foundation

enum BasalProfile: Int, CustomStringConvertible {
    case standard = 0
    case patternA
    case patternB
    
    var description: String {
        switch self {
        case .standard:
            return NSLocalizedString("Standard", comment: "Describing the standard basal pattern")
        case .patternA:
            return NSLocalizedString("Pattern A", comment: "Describing basal pattern A")
        case .patternB:
            return NSLocalizedString("Pattern B", comment: "Describing basal pattern B")
        }
    }
}
