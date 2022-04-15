//
//  ProfileViewModel.swift
//  ProfileCombinePractice
//
//  Created by Johnny Hacking on 4/14/22.
//

import SwiftUI
import Combine

class ProfileViewModel: ObservableObject, Identifiable{
    @Published var person : Person
    
    var id = ""
    private var cancellable = Set<AnyCancellable>()
    
    init(person: Person){
        self.person = person
        
        $person
            .map { item in
                item.id
            }
            .assign(to: \.id ,on: self)
            .store(in: &cancellable)
        
        print(person.id)
        print(person.name)
    }
}
