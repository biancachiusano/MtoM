//
//  ContentView.swift
//  WeSplit
//
//  Created by Bianca Caissotti di Chiusano on 26/07/2021.
//  Copyright © 2021 Bianca Caissotti di Chiusano. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var writtenAnswer = ""
    
   // @State private var showingAlert = false
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Russia", "Spain", "UK","US"].shuffled()
    @State var correctAnswer = Int.random(in: 0...2) //picks a random number
    
    var body: some View{
        ZStack{
           // Color.blue.edgesIgnoringSafeArea(.all) //ensures that the color goes right to the edge of the screen
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30){
                VStack{
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                    
                }
                ForEach(0 ..< 3){ number in
                    Button(action: {
                        self.flagTapped(number)
                    }){
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 2)
                    }
                    
                    
                }
                Spacer()
                Text("SCORE: \(score)")
                    .foregroundColor(.white)
                    .fontWeight(.black)
            }
        }.alert(isPresented: $showingScore){
             Alert(title: Text(scoreTitle), message: Text("Your score is: \(score) \(writtenAnswer)"), dismissButton: .default(Text("Continue")) {
                   self.askQuestion()
               })
        }
        
        /*Button("Show Alert"){
            self.showingAlert = true
        }.alert(isPresented: $showingAlert){
            Alert(title: Text("Hello SwiftUI!"), message: Text("This is some detail message"), dismissButton: .default(Text("OK")))
        }*/
    }
    
    func flagTapped(_ number : Int){
        if number == correctAnswer{
            scoreTitle = "Correct"
            score+=1
        } else {
            scoreTitle = "Wrong"
            writtenAnswer = "This is the flag of: \(countries[number])"
        }
        
        showingScore = true
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
