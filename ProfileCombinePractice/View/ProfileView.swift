//
//  ContentView.swift
//  ProfileCombinePractice
//
//  Created by Johnny Hacking on 4/14/22.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var vm : ProfileViewModel
    @EnvironmentObject var modalAction : ModalAction
    
    var body: some View {
        NavigationView{
            ZStack{
                RoundedRectangle(cornerRadius: 40)
                    .fill(Color.brandSecondary)
                    .padding(.top, 10)
                    .edgesIgnoringSafeArea(.bottom)
                VStack{
                    Text(vm.person.name)
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.bold)
                    Rectangle()
                        .fill(Color.brandBackground)
                        .frame(width: 300, height: 460)
                        .overlay(
                            VStack(alignment:.leading,spacing: 20){
                                rowText(fieldName: "Org", fieldValue: vm.person.org)
                                rowText(fieldName: "Title", fieldValue: vm.person.title)
                                rowText(fieldName: "Email", fieldValue: "cnorris@bhico.com")
                                rowText(fieldName: "Phone", fieldValue: vm.person.phone)
                                Spacer()
                            }
                                .padding())
                    Button {
                        modalAction.showSheet.toggle()
                    } label: {
                        Text("Close")
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.semibold)
                            .padding(.horizontal)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color.brandAccent)
                    .padding()
                    
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(vm: ProfileViewModel(person: MockData.exPerson))
    }
}

struct rowText: View {
    let fieldName : String
    let fieldValue : String
    var body: some View {
        HStack{
            Text("\(fieldName):")
                .fontWeight(.semibold)
            Text(fieldValue)
                .lineLimit(1)
                .minimumScaleFactor(0.6)
        }
        .font(.system(.title, design: .rounded))
    }
}
