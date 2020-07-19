//
//  FilterTableViewCell.swift
//  Heroes
//
//  Created by Muhksin Hilmi on 19/07/2020.
//  Copyright © 2020 LevUp. All rights reserved.
//

import UIKit

class FilterTableViewCell: BaseTableViewCell {
    
    func setButtonView(title: String) {
        let filterFrame = UIView()
        filterFrame.backgroundColor = .black
        filterFrame.layer.cornerRadius = 15
        let filterlabel = UILabel()
        filterlabel.textColor = .white
        filterlabel.text = title
        filterlabel.textAlignment = .center
        filterFrame.vStack(views: filterlabel)
            .padding([.horizontalMargins], amount: 5)
        self.vStack(views: filterFrame.setHeight(40))
            .padding([.allMargins], amount: 10)
    }
}
