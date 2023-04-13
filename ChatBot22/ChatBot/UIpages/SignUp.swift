//
//  SignUp.swift
//  ChatBot
//
//  Created by Rapipay on 27/03/23.
//

import SwiftUI

struct SignUp: View {
    @StateObject private var vm = SignUpViewModel()
    @FocusState var focusedtf: FocusStates?
    @Environment(\.presentationMode) var presentation
    var body: some View {
        VStack{
            VStack{
                Text("Welcome to Chat App").font(.title3).bold()
                    .padding(4)
                Text("Please fill the details and create account").font(.caption2)
            }.padding(30)
            TextField("User name", text: $vm.usernametf)
                .padding()
                .border(Color(.black))
                .cornerRadius(4)
            TextField("First name", text: $vm.firstNametf)
                .padding()
                .border(Color(.black))
                .cornerRadius(4)
            TextField("Second name", text: $vm.lastNametf)
                .padding()
                .border(Color(.black))
                .cornerRadius(4)
            TextField("Password", text: $vm.secrettf)
                .padding()
                .border(Color(.black))
                .cornerRadius(4)
            Button("Sign up", action: {
                focusedtf = nil
                    DispatchQueue.main.asyncAfter(deadline: .now()+0.001)
                {
                    focusedtf = vm.signupUser()
                    
                }
            }).foregroundColor(.white).frame(width: 300, height: 50).background(Color("Darkblue")).cornerRadius(15).padding()
            .alert("Signed up successfully", isPresented: $vm.singupAlert) {
                Button("GO TO SIGN IN") {
                    self.presentation.wrappedValue.dismiss()
                }
            }.alert("Username Already Taken", isPresented: $vm.singupErrorAlert) {}
            HStack{
                Text("Already have an account").font(.caption)
                NavigationLink(destination: LogInView(), label: {
                    Text("Log In").foregroundColor(Color("Darkblue"))
                })
            }
        }.padding(50)
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
