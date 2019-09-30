//
//  LoginModuleCoordinator.swift
//  ExampleApp
//
//  Created by Bastián Véliz Vega on 9/26/19.
//  Copyright © 2019 Bastián Véliz Vega. All rights reserved.
//

import Core
import Login
import UIKit

final class LoginModuleCoordinator: RoutableCoordinator {
    var rootCoordinator: RoutableCoordinator?
    weak var rootViewController: UIViewController?

    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }

    func start(_ completion: @escaping () -> Void) {
        guard let rootViewController = self.rootViewController else {
            preconditionFailure("RootViewController is nil")
        }
        let internalCoordinator = LoginCoordinator(rootCoordinator: self, rootViewController: rootViewController)
        internalCoordinator.rootCoordinator = self
        internalCoordinator.start {
            completion()
        }
    }

    func route(to navigationRoute: NavigationRoute, animated: Bool) {
        guard let loginRoute = navigationRoute as? LoginExternalRoutes else {
            preconditionFailure("navigationRoute must be a LoginExternalRoutes value")
        }

        switch loginRoute {
        case .onboarding:
            self.rootCoordinator?.route(to: MainRoutes.onboarding, animated: animated)
        }
    }
}
