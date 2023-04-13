//
//  LogInView.swift
//  ChatBot
//
//  Created by Rapipay on 27/03/23.
//

import SwiftUI

struct LogInView: View {
    @StateObject private var lg = LogInViewModel()
    @FocusState var logbtn: LogIn?
    @EnvironmentObject private var setting: UserSettings
    var body: some View {
        VStack{
            VStack{
                Text("Welcome to ChatApp").font(.title2).bold()
                Text("Login to access chatbot")
            }.padding()
            TextField("User name",text: $lg.username)
                .padding()
                .border(Color(.black))
                .cornerRadius(4)
            TextField("Password",text: $lg.secret)
                .padding()
                .border(Color(.black))
                .cornerRadius(4)
            Button("Log In", action: {
                logbtn = nil
                
                logbtn = lg.loginuser(settings: self.setting)
                
                
            }).foregroundColor(.white).frame(width: 300, height: 50).background(Color("Darkblue")).cornerRadius(15).padding()
            HStack{
                Text("Need an account").font(.caption)
            NavigationLink( destination: SignUp(), label: {
                Text("Sign Up").foregroundColor((Color("Darkblue")))
            })
        }
        }.padding(50)
        
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
