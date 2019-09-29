//
//  PermissionsWelcomeViewController.swift
//  Permissions
//
//  Created by Bastián Véliz Vega on 9/29/19.
//  Copyright © 2019 Bastián Véliz Vega. All rights reserved.
//

import Core
import UIKit

class PermissionsWelcomeViewController: UIViewController, Routable {
    var router: Router?

    init() {
        super.init(nibName: "PermissionsWelcomeViewController", bundle: Bundle(for: PermissionsWelcomeViewController.self))
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func goToNextPage(_: UIButton) {
        self.router?.route(to: PermissionsRoutes.push, animated: true)
    }
}
