//
//  DasboardViewController.swift
//  Dashboard
//
//  Created by Bastián Véliz Vega on 9/29/19.
//  Copyright © 2019 Bastián Véliz Vega. All rights reserved.
//

import Core
import UIKit

class DasboardViewController: UIViewController, Routable {
    var router: Router?

    init() {
        super.init(nibName: "DasboardViewController", bundle: Bundle(for: DasboardViewController.self))
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @IBAction func logoutButtonPressed(_: UIButton) {
        self.router?.route(to: DashboardRoutes.logout, animated: true)
    }
}
