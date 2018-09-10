//
//  Cell.swift
//  AnimateUITableViewLoad
//
//  Created by Ergün Koçak on 10.09.18.
//  Copyright © 2018 ergunkocak. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    func config(indexPath: IndexPath) {
        label.text = "cell \(indexPath.row)"
    }

}
