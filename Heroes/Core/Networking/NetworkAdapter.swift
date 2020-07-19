//
//  NetworkAdapter.swift
//  Heroes
//
//  Created by Muhksin Hilmi on 18/07/2020.
//  Copyright © 2020 LevUp. All rights reserved.
//

import UIKit

struct NetworkAdapter<T: Codable> {
    
    var request: URLRequest?
    
    func request(service: ServiceAPI, success successCallback: @escaping (Array<T?>?) -> Void, error errorCallback: @escaping (String) -> Void, failure failureCallback: @escaping (Error) -> Void) {
        var baseUrl = Configuration.shared.environment.baseUrl
        baseUrl.append(service.urlPath)
       
        let url: URL = URL(string: baseUrl)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        if !Reachability.isConnectedToNetwork() {
            errorCallback("no internet connection")
            return
        }
        
        let tasks = URLSession.shared.dataTask(with: request){ data, response, error in
            guard let unwrappedData = data else { return }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let req: Array<T?> = try decoder.decode(Array<T?>.self, from: unwrappedData)
                guard let httpResponse = response as? HTTPURLResponse,
                    (200...299).contains(httpResponse.statusCode) else {
                        errorCallback("error connection")
                        return
                }
                successCallback(req)
            } catch {
                errorCallback("parsing failed \(error)")
            }
        }
        tasks.resume()
    }
}
