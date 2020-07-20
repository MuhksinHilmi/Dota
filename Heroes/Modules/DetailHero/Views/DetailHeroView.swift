//
//  DetailHeroView.swift
//  Heroes
//
//  Created Muhksin Hilmi on 19/07/2020.
//  Copyright © 2020 Tutore. All rights reserved.
//

import UIKit

/// DetailHero Module View
class DetailHeroView: UIView {
    
    var presenter: DetailHeroPresenterProtocol!
    var container: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = .white
        return view
    }()
    var profileHeroView: ProfileHeroView = ProfileHeroView()
    var statHeroView: StatusHeroView = StatusHeroView()
    var similarHeroView: SimilarHeroView = SimilarHeroView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(container)
        container.edgeTo(self, safeArea: .all)
        let contentView = UIView()
        contentView.hStack(views: profileHeroView.setWidth(180),
                           statHeroView,
                           spacing: 15)
        self.vStack(views: contentView,
                    similarHeroView,
                    spacers:[.last],
                    spacing: 10)
            .padding([.horizontalMargins], amount: 16)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStatusHero(stat: [StatusEnum]) {
        statHeroView.setStatusData(stat: stat)
    }
}
