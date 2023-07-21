//
//  NewToDoView.swift
//  Study Buddy
//
//  Created by Angela Sloan on 7/20/23.
//

import SwiftUI

struct NewToDoView: View {
    @Environment(\.managedObjectContext) var context
    
    @State var title: String
    @State var isImportant: Bool
    @State var isAssignment: Bool
    @State var isProject: Bool
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color("pinkLight"),Color.white], startPoint: .top, endPoint: .bottom)
            VStack(){
                Text("Task title:")
                    .font(.title3)
                
                TextField("Enter the task description...", text: $title)
                    .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                
                Toggle(isOn: $isAssignment) {
                    Button("Assignment"){
                        
                    }
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    .tint(Color("tan"))
                }
                Toggle(isOn: $isProject){
                    Button("Project"){
                        
                    }
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    .tint(Color("blueLight"))
                }
                Toggle(isOn: $isImportant) {
                    Button("Important"){
                        
                    }
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    .tint(Color("PastelBlueOne"))
                }
                
                Button(action:{
                    self.addTask(title: self.title, isImportant: self.isImportant, isAssignment: self.isAssignment, isProject: self.isProject)
                }){
                    Text("Add")
                }
            }
            .padding()
        }
    }
    private func addTask(title: String, isImportant: Bool = false, isAssignment: Bool = false, isProject: Bool = false) {
        let task = ToDo(context: context)
        task.id = UUID()
        task.title = title
        task.isImportant = isImportant
        //task.isAssignment = isAssignment
        //task.isProject = isProject
        do{
            try context.save()
        }catch{
            print(error)
        }
    }
}

struct NewToDoView_Previews: PreviewProvider {
    static var previews: some View {
        NewToDoView(title: "", isImportant: false, isAssignment: false, isProject: false)
        
    }
}

