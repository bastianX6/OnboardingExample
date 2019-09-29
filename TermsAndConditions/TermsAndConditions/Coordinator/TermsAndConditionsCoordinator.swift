//
//  TermsAndConditionsCoordinator.swift
//  TermsAndConditions
//
//  Created by Bastián Véliz Vega on 9/29/19.
//  Copyright © 2019 Bastián Véliz Vega. All rights reserved.
//

import Foundation

import Core
import UIKit

enum TermsAndConditionsRoutes: NavigationRoute {
    case logout
    case nextFlow
}

public enum TermsAndConditionsExternalRoutes: NavigationRoute {
    case logout
    case nextFlow
}

public final class TermsAndConditionsCoordinator: RoutableCoordinator {
    public var rootCoordinator: RoutableCoordinator?
    public weak var rootViewController: UIViewController?

    private var navigationController: UINavigationController? {
        return self.rootViewController as? UINavigationController
    }

    public init(rootCoordinator: RoutableCoordinator, rootViewController: UIViewController) {
        self.rootCoordinator = rootCoordinator
        self.rootViewController = rootViewController
    }

    public func start(_ completion: @escaping () -> Void) {
        let termsVC = TermsAndConditionsViewController()
        termsVC.router = self
        self.navigationController?.setViewControllers([termsVC], animated: true)
        completion()
    }

    public func route(to navigationRoute: NavigationRoute, animated: Bool) {
        guard let route = navigationRoute as? TermsAndConditionsRoutes else {
            preconditionFailure("navigationRoute must be a TermsAndConditionsRoutes value")
        }

        switch route {
        case .logout:
            self.rootCoordinator?.route(to: TermsAndConditionsExternalRoutes.logout, animated: animated)
        case .nextFlow:
            self.rootCoordinator?.route(to: TermsAndConditionsExternalRoutes.nextFlow, animated: animated)
        }
    }
}
