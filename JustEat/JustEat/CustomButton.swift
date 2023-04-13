//
//  CustomButton.swift
//  JustEat
//
//  Created by Rapipay on 08/02/23.
//

import UIKit

class CustomButton: UIButton {
    //    self.setTitle(
    //        "Log In", for: .normal)
    //    self.fontt   = verdena
    override init(frame: CGRect) {
        super.init(frame: frame)
        custommethod()
        //        self.titleLabel?.font =  UIFont(name: "Verdana", size: 20)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        custommethod()
        //        self.titleLabel?.font =  UIFont(name: "Verdana", size: 20)
    }
    func custommethod(){
        self.titleLabel?.font =  UIFont(name: "Verdana", size: 18)
        
    }}
     
    
    class PrimaryButton: UIButton{
        override init(frame: CGRect) {
            super.init(frame: frame)
            setting()
        }
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            
            setting()
        }
        func setting(){
            self.setTitleColor(.white, for: .normal)
            self.backgroundColor = UIColor(named: "enteredfield")
            self.layer.cornerRadius = self.frame.size.height*0.25
            self.titleLabel?.font =  UIFont(name: "Verdana", size: 18)
        }
        
    }
//    self.titleLabel?.font =  UIFont(name: "Verdana", size: 20)
    /*corner radius = height/4
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }btn.titleLabel?.font = UIFont.init(name: "Helvetica", size:12)
     
     jitne uilable le method hote hai usme init call krte hai
    */

    