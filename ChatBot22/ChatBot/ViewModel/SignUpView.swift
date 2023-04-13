//
//  SignUpView.swift
//  ChatBot
//
//  Created by Rapipay on 27/03/23.
//

import Foundation
enum FocusStates {
    case username
    case secret
    case firstName
    case lastName
}

class SignUpViewModel: ObservableObject {
    
    @Published var usernametf = ""
    @Published var firstNametf = ""
    @Published var lastNametf = ""
    @Published var secrettf = ""
    
    @Published var usernameError = false
    @Published var secretError = false
    @Published var firstNameError = false
    @Published var lastNameError = false
    
    @Published var loading = false
    @Published var singupAlert = false
    @Published var singupErrorAlert = false
    
    
    var focused: FocusStates?
    
    func signupUser() -> FocusStates? {
        if validateUsername(input: usernametf) {
            if validateName(input: firstNametf) {
                if validateName(input: lastNametf) {
                    if validatePassword(input: secrettf) {
                        loading = true
                        NetworkManager.shared.requestForApi(requestInfo: [
                            "httpMethod": "POST",
                            "domain": "users/",
                            "requestType": .createUser as RequestType,
                            "httpBody": [ "username": usernametf, "first_name": firstNametf, "last_name": lastNametf, "secret": secrettf]],
                            completionHandler: { data in
                            print(data)
                            guard let data = data as? [String: Any] else {return}
                            if let data = data["first_name"] as? String {
                                self.singupAlert = true
                            } else {
                                self.singupAlert = true
                            }
                            self.loading = false
                        })
                        return nil
                    } else {
                        secretError = true
                        return .secret
                    }
                } else {
                    lastNameError = true
                    return .lastName
                }
            } else {
                firstNameError = true
                return .firstName
            }
        } else {
            usernameError = true
            return .username
        }
    }
    
    func checkUsername() {
        usernameError = !validateUsername(input: usernametf)
    }
    func checkFirstName() {
        firstNameError = !validateName(input: firstNametf)
    }
    func checkLastName() {
        lastNameError = !validateName(input: lastNametf)
    }
    func checkSecret() {
        secretError = !validatePassword(input: secrettf)
    }
    
    func validateName(input: String) -> Bool {
        let test = NSPredicate(format:"SELF MATCHES %@", "\\w{2,26}")
        return test.evaluate(with: input)
    }
    
    func validateUsername(input: String) -> Bool {
        let test = NSPredicate(format:"SELF MATCHES %@", "\\w{7,18}")
        return test.evaluate(with: input)
    }
    
    func validatePassword(input: String) -> Bool {
        let pswdRegEx = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"
        let pswdPred = NSPredicate(format:"SELF MATCHES %@", pswdRegEx)
        return pswdPred.evaluate(with: input)
    }
}
//internet error handling
//naming
//constant files-> url constant, base url method
//pub sub-> publiscation subscriber
//folder structure
//comments add
//delete unused code
//
