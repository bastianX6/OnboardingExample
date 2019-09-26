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
    var rootViewController: UIViewController? { get }
    func start(_ completion: @escaping () -> Void)
}
