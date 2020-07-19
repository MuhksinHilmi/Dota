//
//  MainView+CollectionViewDelegate.swift
//  Heroes
//
//  Created by Muhksin Hilmi on 19/07/2020.
//  Copyright © 2020 LevUp. All rights reserved.
//

import UIKit

extension MainView: UICollectionViewDelegateFlowLayout {
    func setDataResource() {
        showHeroSource = CollectionDataSource(models: [], configureCell: { (cell, models, indexPath)  -> ShowCollectionViewCell in
//            cell.configureCell(entity: models[indexPath.item])
            return cell
        })
    }
}
