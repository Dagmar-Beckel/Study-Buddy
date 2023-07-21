//
//  Home.swift
//  Study Buddy
//
//  Created by Tenealle Sloan on 7/19/23.
//

import SwiftUI
    
struct Home: View {
    @Environment(\.managedObjectContext) var context
    @FetchRequest(
            entity: ToDo.entity(), sortDescriptors: [ NSSortDescriptor(keyPath: \ToDo.id, ascending: false) ])
        
    var toDoItems: FetchedResults<ToDo>
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
                } .padding()
                
                VStack{
                    Spacer()
                    Text("")
                    Divider()
                        .frame(width: 300, height:2)
                        .overlay(Color("yellowLight"))
                    Text("")

                    Spacer()
                    HStack{

                        Button("Your To Do List"){
                            
                        }
                            .font(.custom("ConcertOne-Regular", size: 20))
                            .buttonStyle(.borderedProminent)
                            .buttonBorderShape(.capsule)
                            .tint(Color("PastelBlueOne"))
                            
                        Spacer()
                    }
                    List {
                        ForEach(toDoItems){ toDoItem in
                            if toDoItem.isImportant == true {
                                Text((toDoItem.title ?? "No title"))
                            } else {Text(toDoItem.title ?? "No title")
                            }
                        }
                        .onDelete(perform: deleteTask)
                    }
                    .listStyle(.plain)
                    
                    
                    
                    
                    Spacer()
                    homeImage
                }
            }
        }
    }
    
     private func deleteTask(offsets: IndexSet) {
        withAnimation {
            offsets.map { toDoItems[$0] }.forEach(context.delete)
            
            do {
                try context.save()
            } catch {
                print(error)
            }
        }
    }
}
        
    


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
