//
//  DashboardCoordinator.swift
//  Dashboard
//
//  Created by Bastián Véliz Vega on 9/29/19.
//  Copyright © 2019 Bastián Véliz Vega. All rights reserved.
//

import Core
import UIKit

enum DashboardRoutes: NavigationRoute {
    case logout
}

public enum DashboardExternalRoutes: NavigationRoute {
    case logout
}

public final class DashboardCoordinator: RoutableCoordinator {
    public var rootCoordinator: RoutableCoordinator?
    public weak var rootViewController: UIViewController?

    public init(rootCoordinator: RoutableCoordinator, rootViewController: UIViewController) {
        self.rootCoordinator = rootCoordinator
        self.rootViewController = rootViewController
    }

    private var navigationController: UINavigationController? {
        return self.rootViewController as? UINavigationController
    }

    public func start(_ completion: @escaping () -> Void) {
        let dashboardVC = DasboardViewController()
        dashboardVC.router = self
        self.navigationController?.setViewControllers([dashboardVC], animated: false)
        completion()
    }

    public func route(to navigationRoute: NavigationRoute, animated: Bool) {
        guard let route = navigationRoute as? DashboardRoutes else {
            preconditionFailure("navigationRoute must be a LoginRoutes value")
        }

        switch route {
        case .logout:
            self.rootCoordinator?.route(to: DashboardExternalRoutes.logout, animated: animated)
        }
    }
}
