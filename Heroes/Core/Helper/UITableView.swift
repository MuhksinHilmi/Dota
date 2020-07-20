//
//  UITableView.swift
//  Heroes
//
//  Created by Muhksin Hilmi on 19/07/2020.
//  Copyright © 2020 LevUp. All rights reserved.
//

import UIKit

extension UITableView{
    public func registerCellClass(_ cellClass: AnyClass) {
        let identifier = String.className(cellClass)
        self.register(cellClass, forCellReuseIdentifier: identifier)
    }
    
    public func registerHeaderFooter(_ cellClass: AnyClass) {
        let identifier = String.className(cellClass)
        self.register(cellClass, forHeaderFooterViewReuseIdentifier: identifier)
    }
}
