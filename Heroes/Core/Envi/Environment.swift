//
//  Environment.swift
//  Heroes
//
//  Created by Muhksin Hilmi on 18/07/2020.
//  Copyright © 2020 LevUp. All rights reserved.
//

import UIKit

enum Environment: String {
    case development = "develop"
    case staging = "staging"
    case production = "production"
    
    var baseUrl: String {
        if  let path = Bundle.main.path(forResource: "DataApp", ofType: "plist"), let xml = FileManager.default.contents(atPath: path), let preferences = try? PropertyListDecoder().decode(DataApp.self, from: xml) {
            return preferences.baseUrl
        }
        return ""
    }
}

struct DataApp: Codable {
    var baseUrl: String
}

class Configuration {
    static let shared = Configuration()
    private init(){}
    lazy var environment: Environment = {
        if let config = Bundle.main.object(forInfoDictionaryKey: "Configuration") as? String {
            print(config)
            if config.range(of:"staging") != nil{
                return Environment.staging
            }
            if config.range(of:"develop") != nil{
                return Environment.development
            }
        }
        
        return Environment.production
    }()
}
