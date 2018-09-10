//
//  ViewController.swift
//  AnimateUITableViewLoad
//
//  Created by Ergün Koçak on 10.09.18.
//  Copyright © 2018 ergunkocak. All rights reserved.
//

import UIKit
import Hero

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var isHeroActive = true
    var shallAnimateCellLoad = true

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if isHeroActive && shallAnimateCellLoad {
            animateCellLoad()
            shallAnimateCellLoad = false
        }
    }

    func animateCellLoad() {
        var delayCounter: TimeInterval = 0
        for cell in tableView.visibleCells {
            UIView.animate(withDuration: TimeInterval(delayCounter), animations: {
                cell.contentView.alpha = 1.0
            }, completion: nil)
            delayCounter += 0.15
        }
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? Cell else {
            print("Warning: cell can not be found!")
            return UITableViewCell()
        }
        cell.config(indexPath: indexPath)
        if isHeroActive && shallAnimateCellLoad {
            cell.contentView.alpha = 0
        }
        return cell
    }
}
