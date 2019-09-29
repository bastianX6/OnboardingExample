//
//  PermissionsModuleCoordinator.swift
//  ExampleApp
//
//  Created by Bastián Véliz Vega on 9/29/19.
//  Copyright © 2019 Bastián Véliz Vega. All rights reserved.
//

import Core
import Permissions
import UIKit

final class PermissionsModuleCoordinator: RoutableCoordinator {
    var rootCoordinator: RoutableCoordinator?
    var rootViewController: UIViewController?

    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }

    func start(_ completion: @escaping () -> Void) {
        guard let rootViewController = self.rootViewController else {
            preconditionFailure("RootViewController is nil")
        }
        let internalCoordinator = PermissionsCoordinator(rootCoordinator: self, rootViewController: rootViewController)
        internalCoordinator.rootCoordinator = self
        internalCoordinator.start {
            completion()
        }
    }

    func route(to navigationRoute: NavigationRoute, animated _: Bool) {
        guard let route = navigationRoute as? PermissionsExternalRoutes else {
            preconditionFailure("navigationRoute must be a PermissionsExternalRoutes value")
        }

        switch route {
        case .nextFlow:
            break
        }
    }
}
