//
//  FirstViewController.swift
//  ReusableViewController
//
//  Created by Andrey Gordeev on 4/15/17.
//  Copyright © 2017 Andrey Gordeev (andrew8712@gmail.com). All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, ReusableHost {
    @IBOutlet weak var containerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        addReusableViewController()
    }

    @IBAction func goBack(segue: UIStoryboardSegue) {
    }
}
