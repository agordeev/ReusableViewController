//
//  ReusableViewController.swift
//  ReusableViewController
//
//  Created by Andrey Gordeev on 4/15/17.
//  Copyright © 2017 Andrey Gordeev (andrew8712@gmail.com). All rights reserved.
//

import UIKit

protocol ReusableHost {
    var containerView: UIView! { get }
    func addReusableViewController()
}

extension ReusableHost where Self: UIViewController {
    func addReusableViewController() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: String(describing: ReusableViewController.self)) as? ReusableViewController else { return }
        vc.willMove(toParentViewController: self)
        addChildViewController(vc)
        containerView.addSubview(vc.view)
        constraintViewEqual(view1: containerView, view2: vc.view)
        vc.didMove(toParentViewController: self)
    }

    /// Sticks child view (view1) to the parent view (view2) using constraints.
    private func constraintViewEqual(view1: UIView, view2: UIView) {
        view2.translatesAutoresizingMaskIntoConstraints = false
        let constraint1 = NSLayoutConstraint(item: view1, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: view2, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: 0.0)
        let constraint2 = NSLayoutConstraint(item: view1, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: view2, attribute: NSLayoutAttribute.trailing, multiplier: 1.0, constant: 0.0)
        let constraint3 = NSLayoutConstraint(item: view1, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: view2, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: 0.0)
        let constraint4 = NSLayoutConstraint(item: view1, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: view2, attribute: NSLayoutAttribute.leading, multiplier: 1.0, constant: 0.0)
        view1.addConstraints([constraint1, constraint2, constraint3, constraint4])
    }
}

class ReusableViewController: UIViewController {
    
}
