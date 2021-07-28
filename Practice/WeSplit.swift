//
//  ContentView.swift
//  WeSplit
//
//  Created by Bianca Caissotti di Chiusano on 26/07/2021.
//  Copyright © 2021 Bianca Caissotti di Chiusano. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var checkAmount = "" //SwiftUI must use a string to store what is entered in a textField
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2 //20%
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        
        
        let tipValue = orderAmount/100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal/peopleCount
        
        return amountPerPerson
    }
    
    var body: some View{
        NavigationView{
            Form{
                   Section{
                       TextField("Amount of money", text: $checkAmount).keyboardType(.decimalPad)
                       
                       //If you create a picker outside of the form, IOS will show you a spinning wheel. Here things look different
                       Picker("Number of People", selection: $numberOfPeople){
                           ForEach(2 ..< 100){
                               Text("\($0) people")
                           }
                       }
                   }
                
                    Section(header: Text("How much tip do you want to leave?")){
                        Picker("Tip percentage", selection: $tipPercentage){
                            ForEach(0 ..< tipPercentages.count){
                                Text("\(self.tipPercentages[$0])%")
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                    Section(header: Text("Total amount of money per person:")){
                           Text("$\(totalPerPerson, specifier:  "%.2f")")
                       }
               }
        }.navigationBarTitle("We Split")
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
