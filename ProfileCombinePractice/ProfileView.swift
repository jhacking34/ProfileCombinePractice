//
//  ContentView.swift
//  ProfileCombinePractice
//
//  Created by Johnny Hacking on 4/14/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 40)
                .fill(Color.brandSecondary)
                .padding(.top, 80)
                .edgesIgnoringSafeArea(.bottom)
            VStack{
                Text("Chuck Norris")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.bold)
                Rectangle()
                    .fill(Color.brandBackground)
                    .frame(width: 300, height: 460)
                    .overlay(
                        VStack(alignment:.leading,spacing: 20){
                            rowText(fieldName: "Org", fieldValue: "BHI")
                            rowText(fieldName: "Title", fieldValue: "IT Director")
                            rowText(fieldName: "Email", fieldValue: "cnorris@bhico.com")
                            rowText(fieldName: "Phone", fieldValue: "720-484-9081")
                            Spacer()
                        }
                            .padding())
                
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
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
