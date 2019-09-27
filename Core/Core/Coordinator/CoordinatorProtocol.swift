//
//  CoordinatorProtocol.swift
//  Core
//
//  Created by Bastián Véliz Vega on 9/26/19.
//  Copyright © 2019 Bastián Véliz Vega. All rights reserved.
//

import Foundation
import UIKit

public protocol Coordinator: AnyObject {
    var rootCoordinator: Coordinator? { get }
    var rootViewController: UIViewController? { get }
    func start(_ completion: @escaping () -> Void)
    func route(to navigationRoute: NavigationRoute, animated: Bool)
}

public protocol NavigationRoute {}

public protocol Coordinable {
    var coordinator: Coordinator? { get set }
}
