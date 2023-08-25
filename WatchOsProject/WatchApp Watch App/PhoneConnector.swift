//
//  WatchConnector.swift
//  WatchApp Watch App
//
//  Created by Palak Sharma on 09/08/23.
//
//
import Foundation
import WatchConnectivity

class PhoneViewModel: NSObject, ObservableObject, WCSessionDelegate {
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    
    var wcSession : WCSession!
    @Published var logs = ""
    
    func willActivate() {
        wcSession = WCSession.default
        wcSession.delegate = self
        wcSession.activate()
    }
    
    func sendMsg() {
        
        let message = ["message": "palak"]
        
        wcSession.sendMessage(message, replyHandler: nil) { (error) in
            self.logs += error.localizedDescription + "\n"
            print(error.localizedDescription)
            
        }
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    
    }

}


//class WatchViewModel: NSObject, ObservableObject, WCSessionDelegate {
//
//    func sessionDidBecomeInactive(_ session: WCSession) {
//
//    }
//
//    func sessionDidDeactivate(_ session: WCSession) {
//
//    }
//
//
//    // MARK: Variables
//    @Published var text: String = ""
//    var wcSession : WCSession!
//
//    func willActivate() {
//        wcSession = WCSession.default
//        wcSession.delegate = self
//        wcSession.activate()
//    }
//    // MARK: WCSession Methods
//
//    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
//
//        let text = message["message"] as! String
//        print(text)
//        self.text = text
//    }
//
//    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
//
//        // Code.
//
//    }
//
//}
