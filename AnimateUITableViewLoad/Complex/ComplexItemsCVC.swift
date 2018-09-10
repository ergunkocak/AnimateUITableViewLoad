//
//  ComplexItemsCVC.swift
//  AnimateUITableViewLoad
//
//  Created by Ergün Koçak on 10.09.18.
//  Copyright © 2018 ergunkocak. All rights reserved.
//

import UIKit
import Hero

class ComplexItemsCVC: UICollectionViewController {

    var selectedIndexPath: IndexPath?

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueItem" {
            if let targetVC = segue.destination as? ComplexItemVC {
                targetVC.itemIndexPath = selectedIndexPath
            }
        }
    }

    // MARK: - CollectionView Datasource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionCell else {
            return UICollectionViewCell()
        }
        cell.config(indexPath: indexPath)
        return cell
    }

    // MARK: - CollectionView Delegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
        performSegue(withIdentifier: "segueItem", sender: self)
    }
}
