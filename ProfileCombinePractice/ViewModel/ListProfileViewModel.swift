//
//  ListProfileViewModel.swift
//  ProfileCombinePractice
//
//  Created by Johnny Hacking on 4/14/22.
//

import SwiftUI
import Combine

class ListProfileViewModel: ObservableObject{
    @Published var organization : Organization
    var id = ""
    var cancellable = Set<AnyCancellable>()
    
    init(org: Organization){
        self.organization = org
        
        $organization
            .map{$0.id}
            .assign(to:\.id, on: self)
            .store(in: &cancellable)
    }
}
