//
//  OnboardingModuleCoordinator.swift
//  ExampleApp
//
//  Created by Bastián Véliz Vega on 9/29/19.
//  Copyright © 2019 Bastián Véliz Vega. All rights reserved.
//

import Core
import Onboarding
import UIKit

final class OnboardingModuleCoordinator: RoutableCoordinator {
    var rootCoordinator: RoutableCoordinator?
    weak var rootViewController: UIViewController?

    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }

    func start(_ completion: @escaping () -> Void) {
        guard let rootViewController = self.rootViewController else {
            preconditionFailure("RootViewController is nil")
        }
        let internalCoordinator = OnboardingCoordinator(rootCoordinator: self, rootViewController: rootViewController)
        internalCoordinator.rootCoordinator = self
        internalCoordinator.start {
            completion()
        }
    }

    func route(to navigationRoute: NavigationRoute, animated _: Bool) {
        guard let route = navigationRoute as? OnboardingExternalRoutes else {
            preconditionFailure("navigationRoute must be a OnboardingExternalRoutes value")
        }

        switch route {
        case .logout:
            self.rootCoordinator?.route(to: MainRoutes.logout, animated: true)
        case .flowEnd:
            self.rootCoordinator?.route(to: MainRoutes.dashboard, animated: true)
        }
    }
}
