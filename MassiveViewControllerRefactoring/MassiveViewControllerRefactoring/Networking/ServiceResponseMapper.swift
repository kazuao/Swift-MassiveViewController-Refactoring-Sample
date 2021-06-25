//
//  ServiceResponseMapper.swift
//  MassiveViewControllerRefactoring
//
//  Created by Kazunori Aoki on 2021/06/23.
//

import Foundation

class ServiceResponseMapper {
    
    func mapData(from response: Data) throws -> [Person] {
        
        let results = try JSONDecoder().decode([Person].self, from: response)
        
        return results
    }
}
