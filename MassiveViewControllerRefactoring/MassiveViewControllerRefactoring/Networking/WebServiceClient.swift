//
//  WebServiceClient.swift
//  MassiveViewControllerRefactoring
//
//  Created by Kazunori Aoki on 2021/06/23.
//

import Foundation

class WebServiceClient {
    
    func fetchDataFromWebService(url: URL, completion: @escaping (Data?, Error?) -> Void) {
        
        let urlSession = URLSession.shared
        
        let dataTask = urlSession.dataTask(with: url) { data, response, error in
            
            guard let data = data else {
                completion(nil, error)
                return
            }
            
            completion(data, error)
        }
        dataTask.resume()
    }
}
