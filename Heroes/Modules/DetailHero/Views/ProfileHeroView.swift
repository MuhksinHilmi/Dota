//
//  ProfileHeroView.swift
//  Heroes
//
//  Created by Muhksin Hilmi on 19/07/2020.
//  Copyright © 2020 LevUp. All rights reserved.
//

import UIKit

class ProfileHeroView: UIView {
    private lazy var heroImage: CustomImageView =  CustomImageView()
    private lazy var nameHeroLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    private lazy var iconTypeImage: UIImageView = UIImageView()
    private lazy var roleHeroLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let nameView: UIView = UIView()
        nameView.hStack(views: iconTypeImage.setHeight(30),
                        nameHeroLabel.setWidth(130),
                        spacing: 15)
        self.vStack(views: heroImage.setHeight(100),
                    nameView,
                    roleHeroLabel,
                    spacing: 3,
                    addShadow: true)
            .setupSubview(backgroundColor: .white, cornerRadius: 5, borderWidth: 0.3, borderColor: .black)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setProfile(hero: HeroesEntity) {
        if let urlImage = hero.img {
            heroImage.loadImageUsingUrlString(Configuration.shared.environment.baseUrl+"\(urlImage)",
                defaultImg: UIImage())
        }
        nameHeroLabel.text = hero.nickName ?? "Unknown"
        iconTypeImage.image = hero.type?.lowercased() ?? "melee" == "melee" ? #imageLiteral(resourceName: "icMelee") : #imageLiteral(resourceName: "icRanged")
        var attrCustom: NSMutableAttributedString!
        attrCustom = NSMutableAttributedString(string: "Role:\n", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .semibold), NSAttributedString.Key.foregroundColor: UIColor.black])
        hero.roleArray.forEach { (role) in
            attrCustom.append(NSAttributedString(string: "\(role.name!) ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .regular), NSAttributedString.Key.foregroundColor: UIColor.black]))
        }
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1
        paragraphStyle.alignment = .center
        attrCustom.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attrCustom.length))
        roleHeroLabel.attributedText = attrCustom
    }
    
    func attrs(font: UIFont, size: CGFloat, color: UIColor) -> [NSAttributedString.Key: Any] {
        [NSAttributedString.Key.font: UIFont.systemFont(ofSize: size, weight: .regular), NSAttributedString.Key.foregroundColor: color]
    }
}
