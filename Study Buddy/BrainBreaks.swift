//
//  ContentView.swift
//  StudyBuddy_Me
//
//  Created by Ryea Mahansaria on 7/18/23.
//

import SwiftUI

struct BrainBreaks: View {
    @State var idea1 = ""
    @State var idea2 = ""
    var options = ["Go for a quick walk","Play a kahoot game", "Play number drop", "Read a few pages of your favorite book", "Eat a snack", "Meditate", "Get a drink", "Organize your room/desk", "Strech", "Lay down", "Watch a short youtube video", "Call your friends", "Go for a run", "Play a sudoku", "Make your favorite snack"]
    
    var body: some View {
        ZStack{
            Color.primary_color.edgesIgnoringSafeArea(.all)
            RadialGradient(colors: [Color("PastelGreen"), Color("PastelGreen")], center: .center, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            Text("Brain Break Ideas!")
                .font(.custom("ConcertOne-Regular", size: 35))
                .padding(.init(top: 0, leading: 0, bottom: 650, trailing: 0))
            VStack {
                
                Button("Generate Options!") {
                    
                    idea1=options[Int.random(in: 0..<options.count)]
                    idea2=options[Int.random(in:0..<options.count)]
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .tint(Color("tan"))
                .font(.custom("ConcertOne-Regular", size: 30))
                .padding(.init(top: 0, leading: 5, bottom: 70, trailing: 0))
                
                Text("Option 1")
                    .font(.title2)
                Text("___________")
                    .padding(.init(top: 0, leading: 5, bottom: 0, trailing: 0))
                Text("\(idea1)")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.init(top: 1, leading: 0, bottom: 50, trailing: 0))
                
                Text("Option 2")
                    .font(.title2)
                Text("____________")
                    .padding(.init(top: 0, leading: 5, bottom: 0, trailing: 0))
                Text("\(idea2)")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.init(top: 1, leading: 0, bottom: 0, trailing: 0))
                
            }
        }
        
    }
}

struct BrainBreaks_Previews: PreviewProvider {
    static var previews: some View {
        BrainBreaks()
    }
}
