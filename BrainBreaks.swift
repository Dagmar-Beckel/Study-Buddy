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
    var options = ["go for a quick walk","play a kahoot game", "play number drop", "read a few pages of your favorite book", "eat a snack", "meditate", "Get a drink", "orginize your room/desk", "strech", "Lay down", "watch a short youtube video", "call your friends", "go for a run", "play a sudoku", "make your favorite snack"]
    
    var body: some View {
     
        VStack {
            Text("Brain Break Ideas!")
            Button("Click to generate options!") {
                idea1=options[Int.random(in: 0..<options.count)]
                idea2=options[Int.random(in:0..<options.count)]
                
                
                
            }
            Text("Option 1 = \(idea1)")
            Text("Option 2 = \(idea2)")
            
        }
    }
}

struct BrainBreaks_Previews: PreviewProvider {
    static var previews: some View {
        BrainBreaks()
    }
}
