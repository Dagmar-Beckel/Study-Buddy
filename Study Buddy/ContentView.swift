//
//  ContentView.swift
//  Study Buddy
//
//  Created by Dagmar Beckel on 7/18/23.
//

import SwiftUI
struct ContentView: View {
    var body: some View {
        ZStack{
            Color.primary_color.edgesIgnoringSafeArea(.all)
            NavigationStack {
                Color.primary_color.edgesIgnoringSafeArea(.all)
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
                        NavigationLink(destination: PomoView()){
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
            
        }
    }
}
        
        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView()
            }
        }
