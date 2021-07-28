//
//  ContentView.swift
//  WeSplit
//
//  Created by Bianca Caissotti di Chiusano on 26/07/2021.
//  Copyright © 2021 Bianca Caissotti di Chiusano. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    //BUTTON
    /*@State private var tapCount = 0

    var body: some View {
        Button("Tap Count: \(tapCount)") {
            self.tapCount += 1
        }
     
    //NAVIGATION BAR
     /*NavigationView{
     Form{
         Section{
             Text("Hello World")
         }
        
         Group{
             Text("Hello World")
             Text("Hello World")
             Text("Hello World")
             Text("Hello World")
             Text("Hello World")
         }
     }.navigationBarTitle("We Split")
     //can also use .navigationBarTitle(Text("We Split"), displayMode: .inline)*/
     
    }*/
    
    //PICKER
    let students = ["Bianca", "Emma", "X"]
    @State private var selectedStudent = "Bianca"
    
    var body: some View{
        Picker("Select your student", selection: $selectedStudent){
            ForEach(0..<students.count){
                Text(self.students[$0])
            }
        }.padding()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
