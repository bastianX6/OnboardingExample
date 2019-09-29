//
//  PermissionUtils.swift
//  Permissions
//
//  Created by Bastián Véliz Vega on 9/29/19.
//  Copyright © 2019 Bastián Véliz Vega. All rights reserved.
//

import Foundation

enum Permission: String {
    case push
    case photos
    case location
}

enum PermissionUtils {
    private static let standardDefaults = UserDefaults(suiteName: "permissions")

    static func setPermissionStatus(enabled: Bool, permission: Permission) {
        self.standardDefaults?.set(enabled, forKey: permission.rawValue)
    }

    static func permissionIsAllowed(_ permission: Permission) -> Bool {
        return self.standardDefaults?.bool(forKey: permission.rawValue) ?? false
    }
}
