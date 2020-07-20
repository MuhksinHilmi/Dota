//
//  ServiceAPI.swift
//  Heroes
//
//  Created by Muhksin Hilmi on 18/07/2020.
//  Copyright © 2020 LevUp. All rights reserved.
//

import Foundation

enum ServiceAPI {
    case heroes
    
    var urlPath: String {
        switch self {
        case .heroes:
            return "/api/herostats"
        }
    }
    
    var method: String {
        switch self {
        default:
            return "GET"
        }
    }
    
    var paramaters: String {
        switch self {
        default:
            return ""
        }
    }
    
    var keyPersistent: String {
        switch self {
        default:
            return "default"
        }
    }
}
