//
//  ContentView.swift
//  Study Buddy
//
//  Created by Dagmar Beckel on 7/18/23.
//

import SwiftUI
struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack{
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: Home()){
                        Text("🏠")
                    }
                }
                
                    ToolbarItem(placement: .navigation) {
                        NavigationLink(destination: Calendar()){
                            Text("🗓️")
                        }
                        
                    }
                ToolbarItem(placement: .navigation) {
                    NavigationLink(destination: Pomo()){
                        Text("⏰")
                    }
                    
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: ListAssign()){
                        Text("✏️")
                    }
                     
                    
                }
            }
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Tasks")
        .fontWeight(.bold)
        .padding()
        VStack{
            Text("stack")
        }
    }
}
        
        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView()
            }
        }
