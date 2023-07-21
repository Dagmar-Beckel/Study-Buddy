//
//  Home.swift
//  Study Buddy
//
//  Created by Tenealle Sloan on 7/19/23.
//

import SwiftUI

struct Home: View {
    var body: some View {
        let taskImage = Image("task")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 50, height: 50)
            
        let calendarImage = Image("calendar")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 50, height: 50)
        let pomoImage = Image("pomo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 55, height: 55)
        let homeImage = Image("home")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 75, height:75, alignment: .center)
        let brainImage = Image("brain")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 50, height: 50)
        NavigationStack{
            ZStack{
                LinearGradient(colors: [Color.white, Color("pinkLight")], startPoint: .top, endPoint: .bottom)
                VStack{
                    
                }
                .toolbar{
                    
                    ToolbarItem(placement: .navigation){
                        NavigationLink(destination: BrainBreaks()){
                            VStack{
                                brainImage
                                Text("Breaks")
                                    .font(.custom("ConcertOne-Regular", size: 15))
                                    .tint(.black)
                            }
                            }
                        }
                        
                    ToolbarItem(placement: .navigation){
                        NavigationLink(destination: ListAssign()){
                            VStack{
                                taskImage
                                Text("Tasks")
                                    .font(.custom("ConcertOne-Regular", size: 15))
                                    .tint(.black)
                            }
                        }
                        
                    } 
                    
                    ToolbarItem(placement: .navigation){
                        NavigationLink(destination: CalendarView()){
                            VStack{
                                calendarImage
                                Text("Calendar")
                                    .font(.custom("ConcertOne-Regular", size: 15))
                                    .tint(.black)
                                
                            }
                        }
                        
                    }
                    ToolbarItem(placement: .navigation){
                        NavigationLink(destination: PomoView()){
                            VStack{
                                pomoImage
                                Text("Timer")
                                    .font(.custom("ConcertOne-Regular", size: 15))
                                    .tint(.black)
                            }
                        }
                        
                    }
                }
                
                VStack{
                            Spacer()
                            homeImage
                        }
            }
        }
        
        
    }
}

        
        
    


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
