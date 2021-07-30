//
//  ContentView.swift
//  WeSplit
//
//  Created by Bianca Caissotti di Chiusano on 26/07/2021.
//  Copyright © 2021 Bianca Caissotti di Chiusano. All rights reserved.
//

import SwiftUI


//how to pass data between views USING RESULT VIEW
struct ResultView : View {
    
    var choice: String
    
    var body: some View{
        Text("You chose \(choice)")
    }
}
struct ContentView: View {
    var body: some View{
        NavigationView{
            VStack(spacing: 30){
                Text("You're going to flip a count - do you want to choose heads or tails?")
            }
            //Two navigationLinks that use the same view
            //you need to specify the choice
            NavigationLink(destination: ResultView(choice: "Heads")){
                Text("Choose Heads")
            }
            NavigationLink(destination: ResultView(choice: "Tails")){
                Text("Choose Tails")
            }
           
            //NavigationLink(destination: Text("Second View")){
                //for images //for example to see the album picture or profile picture
                /*Image("paul").renderingMode(.original)*/
            //}
            .navigationBarTitle("Navigation")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
