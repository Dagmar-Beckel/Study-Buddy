//
//  ListAssign.swift
//  Study Buddy
//
//  Created by Tenealle Sloan on 7/19/23.
//

import SwiftUI

struct ListAssign: View {
    @Environment(\.managedObjectContext) var context
    @State private var showNewTask = false
    @FetchRequest(
        entity: ToDo.entity(), sortDescriptors: [ NSSortDescriptor(keyPath: \ToDo.id, ascending: false) ])
    
    var toDoItems: FetchedResults<ToDo>
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color("tan"), Color("tan")], startPoint: .top, endPoint: .bottom)
            VStack{
                HStack{
                    Text("To Do List")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                    Button(action: {
                        self.showNewTask = true
                    }){
                        Text("+")
                    }
                }
                .padding()
                Spacer()
                
                List {
                    ForEach(toDoItems){ toDoItem in
                        if toDoItem.isImportant == true {
                            Text("‼️" + (toDoItem.title ?? "No title"))
                        } else {
                            Text(toDoItem.title ?? "No title")
                        }
                    }
                    .onDelete(perform: deleteTask)
                }
                .listStyle(.plain)
            }
        }
            
            if showNewTask {
                NewToDoView(title: "", isImportant: false, isAssignment: false, isProject: false)
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


struct ListAssign_Previews: PreviewProvider {
    static var previews: some View {
        ListAssign()
    }
}
