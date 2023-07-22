//
//  Home.swift
//  Study Buddy
//
//  Created by Tenealle Sloan on 7/19/23.
//

import SwiftUI
    



struct Home: View {
    /*  let gradientColors = [Color(hex: "C71FD6"), Color(hex: "DC8219"), Color(hex: "172EAA"), Color(hex: "E93D3D")]
    @Binding var progress: Double
    @Binding var duration: Double*/
    
    //list stuff
    @Environment(\.managedObjectContext) var context
    @FetchRequest(
            entity: ToDo.entity(), sortDescriptors: [ NSSortDescriptor(keyPath: \ToDo.id, ascending: false) ])
        
    
    //home page stuff
    var toDoItems: FetchedResults<ToDo>
    var body: some View {
        /*let homeImage = Image("home")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 75, height:75, alignment: .center)*/
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
        
       
        
        let brainImage = Image("brain")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 55, height: 55)
        
        //timer stuff???
        /*ZStack {
            BubbleView(size: 270, x: 0, y: 0)
            Circle().foregroundColor(Color.main_color).frame(width: 200, height: 200)
            if progress == 0 {
                Image(systemName: "arrowtriangle.right.fill")
                    .resizable().frame(width: 54, height: 60)
                    .foregroundColor(Color.main_secondary_color).offset(x: 5, y: 0)
            } else {
                Text(getSecondsToDuration(Int(duration))).modifier(MontserratFont(.bold, size: 30))
                    .foregroundColor(Color.main_secondary_color)
            }
            Circle()
                .trim(from: 0, to: CGFloat(progress) / 100)
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .butt, dash: [2, 15]))
                .fill(LinearGradient(gradient: .init(colors: gradientColors),
                                     startPoint: .topLeading, endPoint: .trailing))
                .animation(.spring()).frame(width: 325, height: 325)
        } */
        
        NavigationStack{
            
            ZStack{
                Color.primary_color.edgesIgnoringSafeArea(.all)
                //LinearGradient(colors: [Color("pinkLight"), Color("pinkLight")], startPoint: .top, endPoint: .bottom)
                RoundedRectangle(cornerRadius: 0)
                    .foregroundColor(.white)
                    .frame(width: 390, height: 60)
                    .padding(.horizontal)
                    .padding(.bottom, 750)
                VStack{
                    
                }
                .toolbar{
                    
                    ToolbarItem(placement: .navigation){
                        NavigationLink(destination: BrainBreaks()){
                            VStack{
                                /*Divider()
                                    .overlay(Color("pinkDark"))
                                    .frame(height: 2) */
                                
                                brainImage
                                    .padding(.top, 40)
                                    
                                Text("Breaks")
                                    .font(.custom("ConcertOne-Regular", size: 15))
                                    .tint(.black)
                               /* Divider()
                                    .overlay(Color("pinkDark"))
                                    .frame(height: 2) */
                            }
                            .padding(10)
                            
                        }
                    }
                    
                    
                    ToolbarItem(placement: .navigation){
                        NavigationLink(destination: ListAssign()){
                            VStack{
                               /* Divider()
                                    .overlay(Color("pinkDark"))
                                    .frame(height: 2) */
                                taskImage
                                    .padding(.top, 40)
                                Text("Tasks")
                                    .font(.custom("ConcertOne-Regular", size: 15))
                                    .tint(.black)
                                    .padding(.top, 5)
                            }
                            .padding(10)
                        }
                        
                    }
                    
                    ToolbarItem(placement: .navigation){
                        NavigationLink(destination: CalendarView()){
                            VStack{
                                /*Divider()
                                    .overlay(Color("pinkDark"))
                                    .frame(height: 2)*/
                                calendarImage
                                    .padding(.top, 47)
                                Text("Calendar")
                                    .padding(.top,0)
                                    .font(.custom("ConcertOne-Regular", size: 15))
                                    .tint(.black)
                                
                            }
                            .padding(10)
                        }
                        
                    }
                    ToolbarItem(placement: .navigation){
                        NavigationLink(destination: PomoView()){
                            VStack{
                               /* Divider()
                                    .overlay(Color("pinkDark"))
                                    .frame(height: 2) */
                                pomoImage
                                    .padding(.top, 40)
                                Text("Timer")
                                    .font(.custom("ConcertOne-Regular", size: 15))
                                    .tint(.black)
                            }
                            .padding(10)
                        }
                        
                    }
                }
                .padding(50)
                VStack{
                    VStack{
                        Spacer()
                        Text("")
                       /* Divider()
                            .frame(width: 300, height:2)
                            .overlay(Color("yellowLight")) */
                        Text("")
                        
                        
                        HStack{
                            Spacer()
                            Button("Your To Do List"){
                                
                            }
                            .padding(.top,60)
                            .font(.custom("ConcertOne-Regular", size: 20))
                            .buttonStyle(.borderedProminent)
                            .buttonBorderShape(.capsule)
                            .tint(Color("PastelBlueOne"))
                            
                            Spacer()
                        }
                        
                        List {
                            ForEach(toDoItems){ toDoItem in
                                if toDoItem.isImportant == true {
                                    Text("‼️" + (toDoItem.title ?? "No title"))
                                } else {Text(toDoItem.title ?? "No title")
                                }
                            }
                            .onDelete(perform: deleteTask)
                        }
                        
                        .listStyle(.plain)
                        Spacer()
                        /*HStack{
                            Text("    ")
                            Button("Brain Breaks"){
                                
                            }
                            .font(.custom("ConcertOne-Regular", size: 20))
                            .buttonStyle(.borderedProminent)
                            .buttonBorderShape(.capsule)
                            .tint(Color("pinkLight"))
                            
                            Spacer()
                        }*/
                        
                        Spacer()
                        
                        
                    }
                    /*Divider()
                        .overlay(.white)
                        .frame(width:100, height:5) */
                    Spacer()
                    VStack{
                        Button("Calendar"){
                            
                        }
                        .font(.custom("ConcertOne-Regular", size: 20))
                        //.foreground(.black)
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.capsule)
                        .tint(Color("PastelGreen"))
                        
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 50)
                                .foregroundColor(Color("PastelPurple"))
                                .frame(width: 390, height: 300)
                                .padding(.horizontal)
                                .padding(.top, 30)
                            CalendarView()
                                .padding(.top, 25)
                                .padding(.horizontal, 30)
                            
                        }
                        Spacer()
                    }
                    .padding(.bottom, 60)
                }
                .navigationBarBackButtonHidden(true)
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

struct CalendarView1: View {
    
    
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2023, month: 1, day: 1)
        let endComponents = DateComponents(year: 2023, month: 12, day: 31, hour: 23, minute: 59, second: 59)
        return calendar.date(from:startComponents)! ...
        calendar.date(from:endComponents)!
       
        
    }()
    @State private var date = Date()
    var body: some View {
        ScrollView{
        
            VStack{
                // Implement your calendar view here
                // This can be a custom view or a third-party library
                Text("Calendar")
                RoundedRectangle(cornerRadius: 50)
                
                    .foregroundColor(.white)
                
                    .frame(height: 200)
                
                    .padding(.horizontal)
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color(red: 0.97, green: 0.66, blue: 0.69))
                    .padding(.top, 20)
                DatePicker(
                    "Start Date",
                    selection: $date,
                    in: dateRange,
                    displayedComponents: [.date, .hourAndMinute])
                
            }
        }
    }
}
