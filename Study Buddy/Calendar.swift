//
//  Calendar.swift
//  Study Buddy
//
//  Created by Tenealle Sloan on 7/19/23.
//

import SwiftUI

struct Calendar: View {
    var body: some View {
        ZStack{
            Color.primary_color.edgesIgnoringSafeArea(.all)
            VStack{
                Text("Calender")
                    .font(.title)
                    .fontWeight(.heavy)
                Spacer()
            }
        }
    }
}

struct Calendar_Previews: PreviewProvider {
    static var previews: some View {
        Calendar()
    }
}
