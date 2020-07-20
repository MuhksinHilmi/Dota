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
            cell.configureCell(entity: models[indexPath.item])
            return cell
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 130)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let heroEntity = showHeroSource?.models[indexPath.item] {
            presenter.goToDetailHero(heroEntity: heroEntity)
        }
    }
}
