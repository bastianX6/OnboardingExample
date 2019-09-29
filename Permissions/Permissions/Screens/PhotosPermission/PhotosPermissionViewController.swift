//
//  PhotosPermissionViewController.swift
//  Permissions
//
//  Created by Bastián Véliz Vega on 9/29/19.
//  Copyright © 2019 Bastián Véliz Vega. All rights reserved.
//

import Core
import UIKit

class PhotosPermissionViewController: UIViewController, Routable, PermissionsScreen {
    @IBOutlet var textLabel: UILabel!
    @IBOutlet var acceptPermissionButton: UIButton!
    @IBOutlet var rejectPermissionButton: UIButton!

    var router: Router?
    init() {
        super.init(nibName: "PhotosPermissionViewController", bundle: Bundle(for: PhotosPermissionViewController.self))
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func didAcceptPermisson(_: UIButton) {}

    @IBAction func didRejectPermisson(_: UIButton) {}
}
