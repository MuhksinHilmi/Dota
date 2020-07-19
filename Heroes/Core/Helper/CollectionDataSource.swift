//
//  CollectionDataSource.swift
//  Heroes
//
//  Created by Muhksin Hilmi on 19/07/2020.
//  Copyright © 2020 LevUp. All rights reserved.
//

import UIKit

final public class CollectionDataSource<V, T>: NSObject, UICollectionViewDataSource where V: UICollectionViewCell {
    
    public typealias CellConfiguration = (V, [T],IndexPath) -> V
    public var models: [T]
    private let configureCell: CellConfiguration
    public var addRow: Int = 0
    
    public init(models: [T], configureCell: @escaping CellConfiguration) {
        self.models = models
        self.configureCell = configureCell
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count + addRow
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = String.className(V.self)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? V
        
        guard let currentCell = cell else {
            fatalError("Identifier or class not registered with this collection view")
        }
        
        return configureCell(currentCell, models, indexPath)
    }
}
