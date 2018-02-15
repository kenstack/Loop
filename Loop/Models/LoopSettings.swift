//
//  LoopSettings.swift
//  Loop
//
//  Copyright © 2017 LoopKit Authors. All rights reserved.
//

import LoopKit


struct LoopSettings {
    var dosingEnabled = false

    let dynamicCarbAbsorptionEnabled = true

    var glucoseTargetRangeSchedule: GlucoseRangeSchedule?

    var maximumBasalRatePerHour: Double?

    var maximumBolus: Double?

    var suspendThreshold: GlucoseThreshold? = nil

    var retrospectiveCorrectionEnabled = true
    var basalProfileStandard: BasalRateSchedule?
    var basalProfileA: BasalRateSchedule?
    var basalProfileB: BasalRateSchedule?
    var activeBasalProfile: BasalProfile?
}


extension LoopSettings {
    var enabledEffects: PredictionInputEffect {
        var inputs = PredictionInputEffect.all
        if !retrospectiveCorrectionEnabled {
            inputs.remove(.retrospection)
        }
        return inputs
    }
}


extension LoopSettings: RawRepresentable {
    typealias RawValue = [String: Any]
    private static let version = 1

    init?(rawValue: RawValue) {
        guard
            let version = rawValue["version"] as? Int,
            version == LoopSettings.version
        else {
            return nil
        }

        if let dosingEnabled = rawValue["dosingEnabled"] as? Bool {
            self.dosingEnabled = dosingEnabled
        }

        if let rawValue = rawValue["glucoseTargetRangeSchedule"] as? GlucoseRangeSchedule.RawValue {
            self.glucoseTargetRangeSchedule = GlucoseRangeSchedule(rawValue: rawValue)
        }
        
        if let rawValue = rawValue["basalProfileB"] as? BasalRateSchedule.RawValue {
            self.basalProfileB = BasalRateSchedule(rawValue: rawValue)
        }
        
        if let rawValue = rawValue["basalProfileA"] as? BasalRateSchedule.RawValue {
            self.basalProfileA = BasalRateSchedule(rawValue: rawValue)
        }
        
        if let rawValue = rawValue["basalProfileStandard"] as? BasalRateSchedule.RawValue {
            self.basalProfileStandard = BasalRateSchedule(rawValue: rawValue)
        }
        
        if let rawValue = rawValue["activeBasalProfile"] as? BasalProfile.RawValue {
            self.activeBasalProfile = BasalProfile(rawValue: rawValue)
        }

        self.maximumBasalRatePerHour = rawValue["maximumBasalRatePerHour"] as? Double

        self.maximumBolus = rawValue["maximumBolus"] as? Double

        if let rawThreshold = rawValue["minimumBGGuard"] as? GlucoseThreshold.RawValue {
            self.suspendThreshold = GlucoseThreshold(rawValue: rawThreshold)
        }

        if let retrospectiveCorrectionEnabled = rawValue["retrospectiveCorrectionEnabled"] as? Bool {
            self.retrospectiveCorrectionEnabled = retrospectiveCorrectionEnabled
        }
    }

    var rawValue: RawValue {
        var raw: RawValue = [
            "version": LoopSettings.version,
            "dosingEnabled": dosingEnabled,
            "retrospectiveCorrectionEnabled": retrospectiveCorrectionEnabled
        ]

        raw["glucoseTargetRangeSchedule"] = glucoseTargetRangeSchedule?.rawValue
        raw["maximumBasalRatePerHour"] = maximumBasalRatePerHour
        raw["maximumBolus"] = maximumBolus
        raw["minimumBGGuard"] = suspendThreshold?.rawValue
        raw["basalProfileB"] = basalProfileB?.rawValue
        raw["basalProfileA"] = basalProfileA?.rawValue
        raw["basalProfileStandard"] = basalProfileStandard?.rawValue
        raw["activeBasalProfile"] = activeBasalProfile?.rawValue

        return raw
    }
}
