//
//  ComplexContainerVC.swift
//  AnimateUITableViewLoad
//
//  Created by Ergün Koçak on 10.09.18.
//  Copyright © 2018 ergunkocak. All rights reserved.
//

import UIKit
import Hero

class ComplexItemVC: UIViewController {

    @IBOutlet weak var imageItem: UIImageView!
    @IBOutlet weak var labelItem: UILabel!

    var itemIndexPath: IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let indexPath = itemIndexPath else {
            print("Warning: No indexpath for item detail")
            return
        }
        imageItem.hero.id = "itemImage_\(indexPath.row)"
        labelItem.hero.id = "itemLabel_\(indexPath.row)"
        labelItem.text = "Item \(indexPath.row)"

        print("labelItem.hero.id \(labelItem.hero.id)")

        imageItem.hero.modifiers = [.translate(y:100)]

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueEmbedComplexTable" {
            if let targetVC = segue.destination as? ComplexTVC {
                targetVC.mainItemIndexPath = itemIndexPath
            }
        }
    }

    @IBAction func onDismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
