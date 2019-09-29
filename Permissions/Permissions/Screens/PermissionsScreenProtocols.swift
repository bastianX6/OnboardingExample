//
//  PermissionsScreenProtocols.swift
//  Permissions
//
//  Created by Bastián Véliz Vega on 9/29/19.
//  Copyright © 2019 Bastián Véliz Vega. All rights reserved.
//

import UIKit

protocol PermissionsScreen {
    var textLabel: UILabel! { get set }
    var acceptPermissionButton: UIButton! { get set }
    var rejectPermissionButton: UIButton! { get set }

    func didAcceptPermisson(_ sender: UIButton)
    func didRejectPermisson(_ sender: UIButton)
}
