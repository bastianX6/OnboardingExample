//
//  LoginCoordinator.swift
//  Login
//
//  Created by Bastián Véliz Vega on 9/26/19.
//  Copyright © 2019 Bastián Véliz Vega. All rights reserved.
//

import Core
import Foundation
import UIKit

enum LoginRoutes: NavigationRoute {
    case nextView
}

public enum LoginExternalRoutes: NavigationRoute {
    case onboarding
}

public final class LoginCoordinator: Coordinator {
    public var rootCoordinator: Coordinator?
    public weak var rootViewController: UIViewController?

    public init(rootCoordinator: Coordinator, rootViewController: UIViewController) {
        self.rootCoordinator = rootCoordinator
        self.rootViewController = rootViewController
    }

    private var navigationController: UINavigationController? {
        return self.rootViewController as? UINavigationController
    }

    public func start(_ completion: @escaping () -> Void) {
        let loginViewController = LoginViewController()
        loginViewController.coordinator = self
        self.navigationController?.setViewControllers([loginViewController], animated: false)
        completion()
    }

    public func route(to navigationRoute: NavigationRoute, animated: Bool) {
        guard let loginRoute = navigationRoute as? LoginRoutes else {
            preconditionFailure("navigationRoute must be a LoginRoutes value")
        }

        switch loginRoute {
        case .nextView:
            self.rootCoordinator?.route(to: LoginExternalRoutes.onboarding, animated: animated)
        }
    }
}
