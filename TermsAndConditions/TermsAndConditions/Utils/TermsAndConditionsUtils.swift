//
//  TermsAndConditionsUtils.swift
//  TermsAndConditions
//
//  Created by Bastián Véliz Vega on 9/29/19.
//  Copyright © 2019 Bastián Véliz Vega. All rights reserved.
//

import Foundation

enum TermsAndConditionsKeys: String {
    case accepted
}

enum TermsAndConditionsUtils {
    private static let standardDefaults = UserDefaults(suiteName: "terms_and_conditions")

    static func setTermsAndConditionStatus(accepted: Bool, key: TermsAndConditionsKeys) {
        self.standardDefaults?.set(accepted, forKey: key.rawValue)
    }

    static func termsAndConditionIsAccepted(_ key: TermsAndConditionsKeys) -> Bool {
        return self.standardDefaults?.bool(forKey: key.rawValue) ?? false
    }
}
