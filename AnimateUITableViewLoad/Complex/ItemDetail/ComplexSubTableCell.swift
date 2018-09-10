//
//  Cell.swift
//  AnimateUITableViewLoad
//
//  Created by Ergün Koçak on 10.09.18.
//  Copyright © 2018 ergunkocak. All rights reserved.
//

import UIKit

class ComplexSubTableCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    func config(mainItemIndexPath: IndexPath, indexPath: IndexPath) {
        label.text = "Item \(mainItemIndexPath.row) cell \(indexPath.row)"
    }

}
