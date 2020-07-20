//
//  MainView+TableViewDelegate.swift
//  Heroes
//
//  Created by Muhksin Hilmi on 19/07/2020.
//  Copyright © 2020 LevUp. All rights reserved.
//

import UIKit

extension MainView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let roles = presenter.getRoles {
            presenter.fetchDataByRole(role: roles[indexPath.item])
        }
    }
}
