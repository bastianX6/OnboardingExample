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

public enum PermissionsExternalRoutes: NavigationRoute {
    case nextFlow
}

public final class PermissionsCoordinator: OnboardingEnabledCoordinator {
    public var canSkip: Bool {
        return PermissionUtils.permissionIsAllowed(.push) && PermissionUtils.permissionIsAllowed(.location) && PermissionUtils.permissionIsAllowed(.photos)
    }

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
        let welcomeVC = PermissionsWelcomeViewController()
        welcomeVC.router = self
        self.navigationController?.setViewControllers([welcomeVC], animated: true)
        completion()
    }

    public func route(to navigationRoute: NavigationRoute, animated: Bool) {
        guard let route = navigationRoute as? PermissionsRoutes else {
            preconditionFailure("navigationRoute must be a PermissionsRoutes value")
        }

        switch route {
        case .push:
            if !PermissionUtils.permissionIsAllowed(.push) {
                self.routeToPermissonRoute(route: route, animated: animated)
            } else {
                self.route(to: PermissionsRoutes.location, animated: animated)
            }
        case .location:
            if !PermissionUtils.permissionIsAllowed(.location) {
                self.routeToPermissonRoute(route: route, animated: animated)
            } else {
                self.route(to: PermissionsRoutes.photos, animated: animated)
            }
        case .photos:
            if !PermissionUtils.permissionIsAllowed(.photos) {
                self.routeToPermissonRoute(route: route, animated: animated)
            } else {
                self.route(to: PermissionsRoutes.nextFlow, animated: animated)
            }
        case .nextFlow:
            self.rootCoordinator?.route(to: PermissionsExternalRoutes.nextFlow, animated: animated)
        }
    }

    private func routeToPermissonRoute(route: PermissionsRoutes, animated: Bool) {
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
