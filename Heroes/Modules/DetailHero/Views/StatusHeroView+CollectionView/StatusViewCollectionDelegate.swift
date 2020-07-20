//
//  StatusViewCollectionDelegate.swift
//  Heroes
//
//  Created by Muhksin Hilmi on 20/07/2020.
//  Copyright © 2020 LevUp. All rights reserved.
//

import UIKit

extension StatusHeroView: UICollectionViewDelegateFlowLayout {
    func setDataResource() {
        showHeroSource = CollectionDataSource(models: [], configureCell: { (cell, models, indexPath)  -> StatusViewCollectionViewCell in
            cell.configureCell(entity: models[indexPath.item])
            return cell
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: 70)
    }
}
