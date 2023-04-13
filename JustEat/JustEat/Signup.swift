//
//  Signup.swift
//  JustEat
//
//  Created by Rapipay on 07/02/23.
//

import Foundation
import UIKit


class SignUp: UIViewController,UITextFieldDelegate{
    
    @IBOutlet weak var signInButton: UIButton!
    
    @IBOutlet weak var nameOutlet: UITextField!
    @IBOutlet weak var emailOutlet: UITextField!
    @IBOutlet weak var upperMargin: NSLayoutConstraint!
    
    @IBAction func signIn(_ sender: Any) {
        
//            signInButton.backgroundColor = .green
//        signInButton.settitle("Sign In", for: .normal)
        
    }
    @IBOutlet weak var birthdayOutlet: UITextField!
    
    @IBOutlet weak var passwordOutlet: UITextField!
    @IBOutlet weak var labelOutlet: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailOutlet.delegate = self
        nameOutlet.delegate = self
        birthdayOutlet.delegate = self
        passwordOutlet.delegate = self
    
        self.signInButton.setTitle("Sign In", for: .normal)
//        self.signInButton.backgroundColor = "enteredfield"
        
    }
//    func signIn(){
//        signInButton.backgroundColor = .green
//        signInButton.text = "Sign In"
//    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        labelOutlet.isHidden = false
        textField.layer.cornerRadius = 15
        
        if textField == emailOutlet{
            emailOutlet.layer.borderColor = UIColor(named: "enteredfield")?.cgColor
            emailOutlet.layer.borderWidth = 2.0
            labelOutlet.text = "Email or Phone"
            
            upperMargin.constant = 25
            
            nameOutlet.layer.borderColor = UIColor(named: "blankfield")?.cgColor
            birthdayOutlet.layer.borderColor = UIColor(named: "blankfield")?.cgColor
            passwordOutlet.layer.borderColor = UIColor(named: "blankfield")?.cgColor
            
        }
        if textField == nameOutlet{
            nameOutlet.layer.borderColor = UIColor(named: "enteredfield")?.cgColor
            nameOutlet.layer.borderWidth = 2.0
            labelOutlet.text = "Full Name"
            upperMargin.constant = 91
            
            emailOutlet.layer.borderColor = UIColor(named: "blankfield")?.cgColor
            birthdayOutlet.layer.borderColor = UIColor(named: "blankfield")?.cgColor
            passwordOutlet.layer.borderColor = UIColor(named: "blankfield")?.cgColor
        }
        if textField == birthdayOutlet{
            birthdayOutlet.layer.borderColor = UIColor(named: "enteredfield")?.cgColor
            birthdayOutlet.layer.borderWidth = 2.0
            labelOutlet.text = "Birthday"
            upperMargin.constant = 157
            emailOutlet.layer.borderColor = UIColor(named: "blankfield")?.cgColor
            nameOutlet.layer.borderColor = UIColor(named: "blankfield")?.cgColor
            passwordOutlet.layer.borderColor = UIColor(named: "blankfield")?.cgColor
        }
        if textField == passwordOutlet{
            passwordOutlet.layer.borderColor = UIColor(named: "enteredfield")?.cgColor
            passwordOutlet.layer.borderWidth = 2.0
            labelOutlet.text = "Password"
            upperMargin.constant = 223
            birthdayOutlet.layer.borderColor = UIColor(named: "blankfield")?.cgColor
            emailOutlet.layer.borderColor = UIColor(named: "blankfield")?.cgColor
            nameOutlet.layer.borderColor = UIColor(named: "blankfield")?.cgColor
            
        }
        
        
    }
    
        
}
