//
//  WelcomeView.swift
//  Study Buddy
//
//  Created by Angela Sloan on 7/20/23.
//

import SwiftUI

struct WelcomeView: View {
    
    var body: some View {
        let tempGradient = RadialGradient(colors: [Color("pinkLight"), .white], center: .center, startRadius: 200, endRadius: 400)
            .ignoresSafeArea()
        let homeImage = Image("home")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 75, height:75, alignment: .center)
        NavigationStack{
            ZStack{
                tempGradient
                
                VStack{
                    Text("Welcome to")
                        .font(.custom("ConcertOne-Regular", size: 46))
                    Text("")
                    Text("Study Buddy")
                        .font(.custom("ConcertOne-Regular", size: 46))
                    Spacer()
                    NavigationLink(destination: Home()){
                            homeImage}
                    
                    
                }
                Spacer()
               GifImage("WelcomeGif")
                    .frame(width:500, height:110)
                    .border(.white, width: 6)
            }
        }
    }
}


struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
