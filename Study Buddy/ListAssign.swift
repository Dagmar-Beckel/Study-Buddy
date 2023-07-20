//
//  ListAssign.swift
//  Study Buddy
//
//  Created by Tenealle Sloan on 7/19/23.
//

import SwiftUI
struct ListAssign: View {
    var body: some View {
        ZStack{
            Color.primary_color.edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("Assignments")
                    .font(.title)
                    .fontWeight(.heavy)
                Spacer()
            }
        }
        
    }
}
struct ListAssign_Previews: PreviewProvider {
    static var previews: some View {
        ListAssign()
    }
}

