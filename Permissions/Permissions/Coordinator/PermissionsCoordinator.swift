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
    case nextFlow
}

final class PermissionsCoordinator: RoutableCoordinator {
    var rootCoordinator: RoutableCoordinator?
    var rootViewController: UIViewController?

    private var navigationController: UINavigationController? {
        return self.rootViewController as? UINavigationController
    }

    func start(_ completion: @escaping () -> Void) {
        let welcomeVC = PermissionsWelcomeViewController()
        welcomeVC.router = self
        self.navigationController?.setViewControllers([welcomeVC], animated: true)
        completion()
    }

    func route(to navigationRoute: NavigationRoute, animated: Bool) {
        guard let route = navigationRoute as? PermissionsRoutes else {
            preconditionFailure("navigationRoute must be a PermissionsRoutes value")
        }
        switch route {
        case .push:
            let pushVC = PushPermissionViewController()
            pushVC.router = self
            self.navigationController?.setViewControllers([pushVC], animated: animated)
        case .location:
            let locationVC = LocationPermissionViewController()
            locationVC.router = self
            self.navigationController?.setViewControllers([locationVC], animated: animated)
        case .photos:
            let photosVC = PhotosPermissionViewController()
            photosVC.router = self
            self.navigationController?.setViewControllers([photosVC], animated: animated)
        case .nextFlow:
            break
        }
    }
}
