//
//  StatusViewCollectionViewCell.swift
//  Heroes
//
//  Created by Muhksin Hilmi on 20/07/2020.
//  Copyright © 2020 LevUp. All rights reserved.
//

import UIKit

class StatusViewCollectionViewCell: UICollectionViewCell {
    var iconStat: UIImageView = UIImageView()
    var pointStat: UILabel = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        let imageFrame: UIView = UIView()
        imageFrame.vStack(views: iconStat.setHeight(40),
                          spacers: [.last])
        let pointFrame: UIView = UIView()
        pointFrame.vStack(views: pointStat.setHeight(30),
                          spacers: [.first, .last])
        self.hStack(views: imageFrame.setWidth(40),
                    pointFrame,
                    spacing: 10,
                    addShadow: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(entity: StatusEnum) {
        iconStat.image = entity.icon
        pointStat.text = entity.point
    }
}
