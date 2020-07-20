//
//  SimilarHeroView.swift
//  Heroes
//
//  Created by Muhksin Hilmi on 19/07/2020.
//  Copyright © 2020 LevUp. All rights reserved.
//

import UIKit

class SimilarHeroView: UIView {
    var showHeroSource: CollectionDataSource<ShowCollectionViewCell, HeroesEntity>?
    var title: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Similar Heroes"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    lazy var showCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.dataSource = showHeroSource!
        cv.delegate = self
        cv.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        cv.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        cv.registerCellClass(ShowCollectionViewCell.self)
        return cv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setDataResource()
        showCollectionView.dataSource = showHeroSource
        self.hStack(views: title,
                    showCollectionView.setHeight(150),
                    spacing: 15)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setSimilarHeroData(heroes: [HeroesEntity]) {
        showHeroSource?.models = heroes
        showCollectionView.reloadData()
    }
}
