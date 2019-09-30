//
//  OnboardingCoordinator.swift
//  Onboarding
//
//  Created by Bastián Véliz Vega on 9/29/19.
//  Copyright © 2019 Bastián Véliz Vega. All rights reserved.
//

import Core
import Permissions
import TermsAndConditions
import UIKit

public enum OnboardingExternalRoutes: NavigationRoute {
    case logout
    case flowEnd
}

public final class OnboardingCoordinator: RoutableCoordinator {
    private lazy var coordinators: [OnboardingEnabledCoordinator] = {
        guard let rootViewController = self.rootViewController else { return [] }
        let permissionsCoordinator = PermissionsCoordinator(rootCoordinator: self, rootViewController: rootViewController)
        let termsAndConditionsCoordinator = TermsAndConditionsCoordinator(rootCoordinator: self, rootViewController: rootViewController)
        return [termsAndConditionsCoordinator, permissionsCoordinator]
    }()

    public var rootCoordinator: RoutableCoordinator?
    public weak var rootViewController: UIViewController?

    public init(rootCoordinator: RoutableCoordinator, rootViewController: UIViewController) {
        self.rootCoordinator = rootCoordinator
        self.rootViewController = rootViewController
    }

    public func start(_ completion: @escaping () -> Void) {
        self.startNextCoordinator()
        completion()
    }

    public func route(to navigationRoute: NavigationRoute, animated: Bool) {
        if let route = navigationRoute as? PermissionsExternalRoutes {
            self.routePermissionsExternal(route, animated: animated)
        }

        if let route = navigationRoute as? TermsAndConditionsExternalRoutes {
            self.routeTermsAndConditionsExternal(route, animated: animated)
        }
    }

    private func routePermissionsExternal(_ route: PermissionsExternalRoutes, animated: Bool) {
        switch route {
        case .nextFlow:
            self.startNextCoordinator(animated: animated)
        }
    }

    private func routeTermsAndConditionsExternal(_ route: TermsAndConditionsExternalRoutes, animated: Bool) {
        switch route {
        case .nextFlow:
            self.startNextCoordinator(animated: animated)
        case .logout:
            self.rootCoordinator?.route(to: OnboardingExternalRoutes.logout, animated: animated)
        }
    }

    private func startNextCoordinator(animated: Bool = true) {
        guard !self.coordinators.isEmpty else {
            self.rootCoordinator?.route(to: OnboardingExternalRoutes.flowEnd, animated: animated)
            return
        }

        let nextCoordinator = self.coordinators.removeFirst()
        if nextCoordinator.canSkip {
            self.startNextCoordinator(animated: animated)
        } else {
            nextCoordinator.start {}
        }
    }
}
