//
//  PermissionsCoordinator.swift
//  Permissions
//
//  Created by Bastián Véliz Vega on 9/29/19.
//  Copyright © 2019 Bastián Véliz Vega. All rights reserved.
//

import Core
import UIKit

enum PermissionsRoutes: NavigationRoute {
    case push
    case location
    case photos
}

final class PermissionsCoordinator: RoutableCoordinator {
    var rootCoordinator: RoutableCoordinator?
    var rootViewController: UIViewController?

    func start(_ completion: @escaping () -> Void) {
        completion()
    }

    func route(to navigationRoute: NavigationRoute, animated: Bool) {
        guard let route = navigationRoute as? PermissionsRoutes else {
            preconditionFailure("navigationRoute must be a PermissionsRoutes value")
        }
        let animated = animated
        switch route {
        case .push:
            break
        case .location:
            break
        case .photos:
            break
        }
    }
}
