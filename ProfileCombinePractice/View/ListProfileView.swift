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
                        Text(personObject.name)
                            .font(.title3)
                            .sheet(isPresented: $modalAction.showSheet) {
                                ProfileView(vm: ProfileViewModel(person: personObject))
                            }
                            .onTapGesture {
                                modalAction.showSheet.toggle()
                            }
                    }
                }
                
            }
            
            
        }
    }
}

struct ListProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ListProfileView()
    }
}
