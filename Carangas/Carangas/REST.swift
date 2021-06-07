//
//  REST.swift
//  Carangas
//
//  Created by Clara Nascimento on 26/05/21.
//  Copyright © 2021 Eric Brito. All rights reserved.
//

import Foundation

class REST {
    
    private static let basePath = "https://carangas.herokuapp.com/cars"
    
    private static let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.allowsCellularAccess = false
        config.httpAdditionalHeaders = ["Content-Type": "application/json"]
        config.timeoutIntervalForRequest = 30.0
        config.httpMaximumConnectionsPerHost = 5
        return config
    } ()
    
    private static let session = URLSession(configuration: configuration)    //URLSession.shared
    
    class func loadCars() {
        guard let url = URL(string: basePath) else {return}
        
        let dataTask = session.dataTask(with: url) {(data: Data?, response: URLResponse?, error: Error?) in
            
            if error == nil {
                
                guard let response = response as? HTTPURLResponse else {return}
                if response.statusCode == 200 {
                    
                    guard let data = data else {return}
                    
                    
                } else {
                    print("Algum status inválido pelo servidor!!")
                }
                
            } else {
                print(error!)
            }

        }
        dataTask.resume()
        
    }
}
