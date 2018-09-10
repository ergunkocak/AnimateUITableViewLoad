//
//  CollectionCell.swift
//  AnimateUITableViewLoad
//
//  Created by Ergün Koçak on 10.09.18.
//  Copyright © 2018 ergunkocak. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!

    func config(indexPath: IndexPath) {
        image.layer.cornerRadius = 8 
        label.text = "\(indexPath.row)"

        label.hero.id = "itemLabel_\(indexPath.row)"
        image.hero.id = "itemImage_\(indexPath.row)"
    }

}
