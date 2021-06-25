//
//  PersonUtility.swift
//  MassiveViewControllerRefactoring
//
//  Created by Kazunori Aoki on 2021/06/23.
//

import Foundation

class PersonUtility {
    
    static func sortPeopleByName(unsourtedPeople: [Person]) -> [Person] {
        return unsourtedPeople.sorted(by: { $0.name < $1.name })
    }
    
    static func sortPeopleByAge(unsourtedPeople: [Person]) -> [Person] {
        return unsourtedPeople.sorted(by: { $0.age < $1.age })
    }
}
