//
//  CoordinatorProtocol.swift
//  Core
//
//  Created by Bastián Véliz Vega on 9/26/19.
//  Copyright © 2019 Bastián Véliz Vega. All rights reserved.
//

import Foundation
import UIKit

public typealias RoutableCoordinator = Coordinator & Router
public typealias OnboardingEnabledCoordinator = RoutableCoordinator & Discardable
public protocol Router: AnyObject {
    func route(to navigationRoute: NavigationRoute, animated: Bool)
}

public protocol Coordinator: AnyObject {
    var rootCoordinator: RoutableCoordinator? { get }
    var rootViewController: UIViewController? { get }
    func start(_ completion: @escaping () -> Void)
}

public protocol Discardable {
    var canSkip: Bool { get }
}

public protocol NavigationRoute {}

public protocol Routable {
    var router: Router? { get set }
}
