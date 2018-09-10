//
//  ComplexTVC.swift
//  AnimateUITableViewLoad
//
//  Created by Ergün Koçak on 10.09.18.
//  Copyright © 2018 ergunkocak. All rights reserved.
//

import UIKit

class ComplexTVC: UITableViewController {

    var isHeroActive = true
    var shallAnimateCellLoad = true

    var mainItemIndexPath: IndexPath!

    override func viewDidLoad() {
        super.viewDidLoad()
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

    // MARK: - TableView Datasource

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }

    // MARK: - TableView Delegate

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ComplexSubTableCell else {
            print("Warning: cell can not be found!")
            return UITableViewCell()
        }
        cell.config(mainItemIndexPath: mainItemIndexPath, indexPath: indexPath)
        if isHeroActive && shallAnimateCellLoad {
            cell.contentView.alpha = 0
        }
        print("sub cell \(indexPath.row)")
        return cell
    }

}
