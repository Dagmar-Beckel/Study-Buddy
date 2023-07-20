//
//  Home.swift
//  Study Buddy
//
//  Created by Tenealle Sloan on 7/19/23.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ZStack{
            Color.primary_color.edgesIgnoringSafeArea(.all)
            VStack{
                Text("Home View")
            }
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
