//
//  PushPermissionViewController.swift
//  Permissions
//
//  Created by Bastián Véliz Vega on 9/29/19.
//  Copyright © 2019 Bastián Véliz Vega. All rights reserved.
//

import Core
import UIKit

class PushPermissionViewController: UIViewController, Routable, PermissionsScreen {
    @IBOutlet var textLabel: UILabel!
    @IBOutlet var acceptPermissionButton: UIButton!
    @IBOutlet var rejectPermissionButton: UIButton!

    var router: Router?

    init() {
        super.init(nibName: "PushPermissionViewController", bundle: Bundle(for: PushPermissionViewController.self))
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func didAcceptPermisson(_: UIButton) {
        PermissionUtils.setPermissionStatus(enabled: true, permission: .push)
        self.router?.route(to: PermissionsRoutes.location, animated: true)
    }

    @IBAction func didRejectPermisson(_: UIButton) {
        PermissionUtils.setPermissionStatus(enabled: false, permission: .push)
        self.router?.route(to: PermissionsRoutes.location, animated: true)
    }
}
