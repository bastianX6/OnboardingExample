//
//  MainCoordinator.swift
//  ExampleApp
//
//  Created by Bastián Véliz Vega on 9/26/19.
//  Copyright © 2019 Bastián Véliz Vega. All rights reserved.
//

import Core
import UIKit

enum MainRoutes: NavigationRoute {
    case onboarding
    case logout
    case permissions
    case dashboard
    case termsAndConditions
}

final class MainCoordinator: RoutableCoordinator {
    var rootCoordinator: RoutableCoordinator?
    weak var rootViewController: UIViewController?

    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }

    func start(_ completion: @escaping () -> Void) {
        guard let rootViewController = self.rootViewController else {
            preconditionFailure("RootViewController is nil")
        }
        let loginCoordinator = LoginModuleCoordinator(rootViewController: rootViewController)
        loginCoordinator.rootCoordinator = self
        loginCoordinator.start {
            completion()
        }
    }

    func route(to navigationRoute: NavigationRoute, animated _: Bool) {
        guard let mainRoute = navigationRoute as? MainRoutes else {
            preconditionFailure("navigationRoute must be a MainRoutes value")
        }
        switch mainRoute {
        case .onboarding:
            self.routeToOnboarding()
        case .logout:
            self.routeToLogin()
        case .permissions:
            self.routeToPermissions()
        case .dashboard:
            self.routeToDashboard()
        case .termsAndConditions:
            self.routeToTermsAndConditions()
        }
    }

    private func routeToPermissions() {
        guard let rootViewController = self.rootViewController else {
            preconditionFailure("RootViewController is nil")
        }

        let coordinator = PermissionsModuleCoordinator(rootViewController: rootViewController)
        coordinator.rootCoordinator = self
        coordinator.start {}
    }

    private func routeToLogin() {
        guard let rootViewController = self.rootViewController else {
            preconditionFailure("RootViewController is nil")
        }
        let loginCoordinator = LoginModuleCoordinator(rootViewController: rootViewController)
        loginCoordinator.rootCoordinator = self
        loginCoordinator.start {}
    }

    private func routeToDashboard() {
        guard let rootViewController = self.rootViewController else {
            preconditionFailure("RootViewController is nil")
        }
        let dashboardCoordinator = DashboardModuleCoordinator(rootViewController: rootViewController)
        dashboardCoordinator.rootCoordinator = self
        dashboardCoordinator.start {}
    }

    private func routeToTermsAndConditions() {
        guard let rootViewController = self.rootViewController else {
            preconditionFailure("RootViewController is nil")
        }
        let termsCoordinator = TermsAndConditionsModuleCoordinator(rootViewController: rootViewController)
        termsCoordinator.rootCoordinator = self
        termsCoordinator.start {}
    }

    private func routeToOnboarding() {
        guard let rootViewController = self.rootViewController else {
            preconditionFailure("RootViewController is nil")
        }
        let onboardingCoordinator = OnboardingModuleCoordinator(rootViewController: rootViewController)
        onboardingCoordinator.rootCoordinator = self
        onboardingCoordinator.start {}
    }
}
