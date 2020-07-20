//
//  StatusHeroView.swift
//  Heroes
//
//  Created by Muhksin Hilmi on 19/07/2020.
//  Copyright © 2020 LevUp. All rights reserved.
//

import UIKit

class StatusHeroView: UIView {
    var showHeroSource: CollectionDataSource<StatusViewCollectionViewCell, StatusEnum>?
    lazy var showCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.dataSource = showHeroSource!
        cv.delegate = self
        cv.contentInset = UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0)
        cv.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        cv.registerCellClass(StatusViewCollectionViewCell.self)
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setDataResource()
        showCollectionView.dataSource = showHeroSource
        self.vStack(views: showCollectionView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStatusData(stat: [StatusEnum]) {
        showHeroSource?.models = stat
        showCollectionView.reloadData()
    }
}
