//
//  StatusEnum.swift
//  Heroes
//
//  Created by Muhksin Hilmi on 20/07/2020.
//  Copyright © 2020 LevUp. All rights reserved.
//

import UIKit

enum StatusEnum {
    case attack(val: String), armor(val: String), health(val: String), mana(val: String), speed(val: String), attr(val: String)
    
    var icon: UIImage {
        switch self {
        case .attack:
           return #imageLiteral(resourceName: "icAttack")
        case .armor:
           return #imageLiteral(resourceName: "icArmor")
        case .health:
           return #imageLiteral(resourceName: "icHealth")
        case .mana:
           return #imageLiteral(resourceName: "icMana")
        case .speed:
           return #imageLiteral(resourceName: "icSpeed")
        case .attr:
           return #imageLiteral(resourceName: "icAttr")
        }
    }
    
    var point: String {
        switch self {
        case .attack(let val):
           return val
        case .armor(let val):
           return val
        case .health(let val):
           return val
        case .mana(let val):
           return val
        case .speed(let val):
           return val
        case .attr(let val):
           return val
        }
    }
}
