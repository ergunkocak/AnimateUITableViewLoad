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

    var mainItemIndexPath: IndexPath?

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
