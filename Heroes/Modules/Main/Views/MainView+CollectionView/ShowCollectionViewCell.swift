//
//  ShowCollectionViewCell.swift
//  Heroes
//
//  Created by Muhksin Hilmi on 19/07/2020.
//  Copyright © 2020 LevUp. All rights reserved.
//

import UIKit

class ShowCollectionViewCell: UICollectionViewCell {
    let imageHero: CustomImageView = CustomImageView()
    let nameHero: UILabel = {
        var label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let imageFrame: UIView = UIView()
        imageFrame.hStack(views: imageHero.setWidth(100),
                          spacers: [.first, .last],
                          distribution: .equalCentering,
                          addShadow: true)
            .padding([.top], amount: 10)
        
        nameHero.textAlignment = .center
        self.vStack(views: imageFrame.setHeight(90),
                    nameHero,
                    spacing: 10,
                    addShadow: true)
            .setupSubview(backgroundColor: .white, cornerRadius: 8, borderWidth: 0.3, borderColor: .black)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(entity: HeroesEntity) {
        if let urlImage = entity.img {
            imageHero.loadImageUsingUrlString(Configuration.shared.environment.baseUrl+"\(urlImage)", defaultImg: UIImage())
        }
        nameHero.text = entity.nickName ?? "unknown"
    }
}
