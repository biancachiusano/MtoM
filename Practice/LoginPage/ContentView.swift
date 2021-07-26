//
//  ContentView.swift
//  LoginPage
//
//  Created by Bianca Caissotti di Chiusano on 26/07/2021.
//  Copyright © 2021 Bianca Caissotti di Chiusano. All rights reserved.
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0)

let storedUsername = "Bi chiusano"
let storedPassword = "Hello"


struct ContentView: View {
    
    //state property is being read by the view
    //every time the state property changes, the view get rerendered and updated as well
    //this is how the user sees what he has entered - changes the text in the textfield
    @State var username: String = ""
    @State var password: String = ""
    @State var authenticationDidFail: Bool = false
    @State var authenticationDidSucceed: Bool = false
    
    var body: some View {
        
        ZStack{
            
            
            VStack{
                  WelcomeText()
                  UserImage() //oploaded picutre in assets folder
                  UsernameTextField(username: $username)
                  PasswordSecureField(password: $password)
                  if authenticationDidFail{
                      Text("Information not correct, try again bro")
                          .offset(y: -10)
                          .foregroundColor(.green)
                  }
                
                Button(action : {
                    if self.username == storedUsername && self.password == storedPassword{
                        self.authenticationDidSucceed = true
                        self.authenticationDidFail = false
                    } else {
                        self.authenticationDidFail = true
                    }
                }){ LoginButtonContent()}
              }.padding()
            
            
            if authenticationDidSucceed {
                Text("Success")
                    .font(.headline)
                    .frame(width: 250, height: 80)
                    .background(Color.green)
                    .animation(Animation.default)
            }
        }
  
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WelcomeText: View {
    var body: some View {
        Text("Welcome")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom,20)
    }
}

struct UserImage: View {
    var body: some View {
        Image("sampleProfile")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 75)
    }
}

struct LoginButtonContent: View {
    var body: some View {
        Text("Continue")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.black)
    }
}

struct UsernameTextField: View {
    
    //declare binding property //connects to the state property from the ContentView
    //A parameter has to be passed to this method
    //"Data bridge"
    @Binding var username: String
    
    var body: some View {
        TextField("username", text: $username)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom,20)
    }
}

struct PasswordSecureField: View {
    @Binding var password: String
    
    var body: some View {
        SecureField("password", text: $password)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom,20)
    }
}
