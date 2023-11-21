//
//  ContentView.swift
//  CPB_Firebase
//
//  Created by Valerie Morales on 11/6/23.
//

import SwiftUI
import FirebaseDatabaseSwift
import FirebaseDatabase

struct ContentView: View {
    @ObservedObject var viewModel = CollegeViewModel()
    @State var showAlert = false
    @State var collegeName = ""
    @State var studentNumber = ""
    @State var locationName = ""
    @State var theURL = ""
    
    var body: some View {
        
        
        NavigationStack {
            Button {
                showAlert = true
            } label: {
                Text("add college")
                
            } .alert("enter college information", isPresented: $showAlert) {
                TextField("enter a name", text: $collegeName)
                TextField("enter the location", text: $studentNumber)
                TextField("enter the number of students", text: $locationName)
                TextField("enter the url", text: $theURL)
                Button("submit") {
                    let newCollege = CollegeProfile(name: collegeName, numberOfStudents: studentNumber, location: locationName, nameURL: theURL)
                    viewModel.AddCollege(currentCollege: newCollege)
                    collegeName = ""
                    showAlert = false
                    print(8)
                    // test
                }
            }
           
            List {
                ForEach(viewModel.Colleges, id: \.name) { currentCollege in
                    VStack {
                        Text(currentCollege.name)
                        Text(currentCollege.numberOfStudents)
                        Text(currentCollege.location)
                        Text(currentCollege.nameURL)
                    }
                }
            }
        } .navigationTitle("College Profile Builder")
            .padding()
    
    }
}

#Preview {
    ContentView()
}
