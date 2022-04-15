//
//  ListProfileView.swift
//  ProfileCombinePractice
//
//  Created by Johnny Hacking on 4/14/22.
//

import SwiftUI

struct ListProfileView: View {
    @StateObject var vm = ListProfileViewModel(org: MockData.testInc)
    @EnvironmentObject var modalAction : ModalAction
    @State var navAction = false
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Text("Company: ")
                    Text("Test company")
                }
                .font(.largeTitle)
                List{
                    ForEach(vm.organization.people, id:\.id) { personObject in
                        NavigationLink (destination:ProfileView(vm: ProfileViewModel(person: personObject)), isActive: $navAction
                            ,label: {
                            Text(personObject.name)
                                .font(.title3)
                        })

                    }
                }
                
            }
            .navigationBarHidden(true)
            
        }
    }
}

struct ListProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ListProfileView()
    }
}
