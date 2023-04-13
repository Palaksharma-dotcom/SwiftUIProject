//
//  BaseViewController.swift
//  JustEat
//
//  Created by Rapipay on 06/02/23.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setGradient(topColor: UIColor(named: "darkShade") ?? .white, bottonColor: UIColor(named: "lightShade") ?? .white)

        // Do any additional setup after loading the view.
    }
    func setGradient(topColor: UIColor, bottonColor: UIColor){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottonColor.cgColor]
        gradientLayer.startPoint  = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.1, y: 1.1)
        gradientLayer.locations = [0.0,1 ]
        gradientLayer.frame = view.frame
//        gradientLayer.frame = view.bounds
        view.layer.addSublayer(gradientLayer)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
