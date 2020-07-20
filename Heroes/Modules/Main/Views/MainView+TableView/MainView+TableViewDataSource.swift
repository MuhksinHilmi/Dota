//
//  MainView+TableViewDataSource.swift
//  Heroes
//
//  Created by Muhksin Hilmi on 19/07/2020.
//  Copyright © 2020 LevUp. All rights reserved.
//

import UIKit

extension MainView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getRoles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FilterTableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: FilterTableViewCell.identifier)
        if let roles = presenter.getRoles {
            cell.setButtonView(title: roles[indexPath.item])
        }
        return cell
    }
}
