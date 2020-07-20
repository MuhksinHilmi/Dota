//
//  MainView.swift
//  Heroes
//
//  Created Muhksin Hilmi on 18/07/2020.
//  Copyright © 2020 Tutore. All rights reserved.
//

import UIKit

/// Main Module View
class MainView: UIView {
    var presenter: MainPresenterProtocol!
    var showHeroSource: CollectionDataSource<ShowCollectionViewCell, HeroesEntity>?
    var errorLabel: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.font = .boldSystemFont(ofSize: 14)
        return lbl
    }()
    lazy var filterTableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        tv.backgroundColor = .clear
        tv.separatorStyle = .none
        tv.rowHeight = UITableView.automaticDimension
        tv.dataSource = self
        tv.delegate = self
        tv.registerCellClass(FilterTableViewCell.self)
        return tv
    }()
    
    lazy var showCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.dataSource = showHeroSource!
        cv.delegate = self
        cv.contentInset = UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0)
        cv.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        cv.registerCellClass(ShowCollectionViewCell.self)
        return cv
    }()
    
    var container: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = .white
        return view
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setDataResource()
        showCollectionView.dataSource = showHeroSource
        addSubview(container)
        container.edgeTo(self, safeArea: .all)
        let contentView = UIView()
        contentView.hStack(views: filterTableView.setWidth(120),
                           showCollectionView)
        container.vStack(views: errorLabel,
                         contentView)
    }
    
    func reloadDataRoles() {
        filterTableView.reloadData()
    }
    
    func setDataHeroes(heroes: [HeroesEntity]?) {
        showHeroSource?.models = heroes!
        showCollectionView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
