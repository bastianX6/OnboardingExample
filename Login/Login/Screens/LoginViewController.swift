//
//  LoginViewController.swift
//  Login
//
//  Created by Bastián Véliz Vega on 9/26/19.
//  Copyright © 2019 Bastián Véliz Vega. All rights reserved.
//

import Core
import UIKit

class LoginViewController: UIViewController, Coordinable {
    @IBOutlet var userTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!

    var coordinator: Coordinator?

    init() {
        super.init(nibName: "LoginViewController", bundle: Bundle(for: LoginViewController.self))
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func loginButtonPressed(_: UIButton) {}

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
}
