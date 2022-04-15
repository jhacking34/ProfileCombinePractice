//
//  Person.swift
//  ProfileCombinePractice
//
//  Created by Johnny Hacking on 4/14/22.
//

import SwiftUI

struct Person: Identifiable{
    var id    = UUID().uuidString
    var name  : String
    var org   : String
    var title : String
    var phone : String
}

struct Organization: Identifiable{
    var id = UUID().uuidString
    var companyName : String 
    var people : [Person]
}

struct MockData{
    static let exPerson  = Person(name: "Chuck Norris", org: "Test Inc", title: "Title", phone: "555-5555")
    static let exPerson2 = Person(name: "John Smith", org: "Test Inc", title: "King", phone: "666-6666")
    
    static let testInc   = Organization(companyName: "Test Inc", people: [exPerson, exPerson2])
}
