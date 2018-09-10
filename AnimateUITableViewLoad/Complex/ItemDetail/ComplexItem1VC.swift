//
//  ComplexContainerVC.swift
//  AnimateUITableViewLoad
//
//  Created by Ergün Koçak on 10.09.18.
//  Copyright © 2018 ergunkocak. All rights reserved.
//

import UIKit
import Hero

class ComplexItem1VC: ComplexItemBaseVC {

    @IBOutlet weak var constraintViewBottomTop: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        perform(#selector(animateBottom), with: nil, afterDelay: 0)
    }

    @objc func animateBottom() {
        print("animateBottom")
        self.constraintViewBottomTop.constant = 0
        UIView.animate(
            withDuration: 0.55,
            delay: 0,
            options: UIViewAnimationOptions.curveEaseInOut,
            animations: {
                self.view.layoutIfNeeded()
            },
            completion: { isCompleted in
                print("animateBottom done \(isCompleted)")
            }
        )
    }

}
