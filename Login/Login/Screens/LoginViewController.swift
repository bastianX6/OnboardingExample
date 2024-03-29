//
//  LoginViewController.swift
//  Login
//
//  Created by Bastián Véliz Vega on 9/26/19.
//  Copyright © 2019 Bastián Véliz Vega. All rights reserved.
//

import Core
import UIKit

class LoginViewController: UIViewController, Routable {
    @IBOutlet var userTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!

    var router: Router?

    init() {
        super.init(nibName: "LoginViewController", bundle: Bundle(for: LoginViewController.self))
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @IBAction func loginButtonPressed(_: UIButton) {
        self.router?.route(to: LoginRoutes.nextView, animated: true)
    }
}
