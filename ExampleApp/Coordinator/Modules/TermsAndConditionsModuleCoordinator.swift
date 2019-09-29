//
//  TermsAndConditionsModuleCoordinator.swift
//  ExampleApp
//
//  Created by Bastián Véliz Vega on 9/29/19.
//  Copyright © 2019 Bastián Véliz Vega. All rights reserved.
//

import Core
import TermsAndConditions
import UIKit

final class TermsAndConditionsModuleCoordinator: RoutableCoordinator {
    var rootCoordinator: RoutableCoordinator?
    weak var rootViewController: UIViewController?

    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }

    func start(_ completion: @escaping () -> Void) {
        guard let rootViewController = self.rootViewController else {
            preconditionFailure("RootViewController is nil")
        }
        let internalCoordinator = TermsAndConditionsCoordinator(rootCoordinator: self, rootViewController: rootViewController)
        internalCoordinator.rootCoordinator = self
        internalCoordinator.start {
            completion()
        }
    }

    func route(to navigationRoute: NavigationRoute, animated _: Bool) {
        guard let route = navigationRoute as? TermsAndConditionsExternalRoutes else {
            preconditionFailure("navigationRoute must be a TermsAndConditionsExternalRoutes value")
        }

        switch route {
        case .logout:
            self.rootCoordinator?.route(to: MainRoutes.logout, animated: true)
        case .nextFlow:
            break
        }
    }
}
