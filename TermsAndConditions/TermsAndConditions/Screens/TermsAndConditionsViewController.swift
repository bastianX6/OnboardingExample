//
//  TermsAndConditionsViewController.swift
//  TermsAndConditions
//
//  Created by Bastián Véliz Vega on 9/29/19.
//  Copyright © 2019 Bastián Véliz Vega. All rights reserved.
//

import Core
import UIKit

class TermsAndConditionsViewController: UIViewController, Routable {
    var router: Router?

    init() {
        super.init(nibName: "TermsAndConditionsViewController", bundle: Bundle(for: TermsAndConditionsViewController.self))
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func didAceptTermsAndConditions(_: UIButton) {
        TermsAndConditionsUtils.setTermsAndConditionStatus(accepted: true, key: .accepted)
        self.router?.route(to: TermsAndConditionsRoutes.nextFlow, animated: true)
    }

    @IBAction func didRejectTermsAndConditions(_: UIButton) {
        TermsAndConditionsUtils.setTermsAndConditionStatus(accepted: false, key: .accepted)
        self.router?.route(to: TermsAndConditionsRoutes.logout, animated: true)
    }
}
