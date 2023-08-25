//
//  PhoneConnector.swift
//  WatchApp Watch App
//
//  Created by Palak Sharma on 09/08/23.
//
//


import Foundation
import WatchConnectivity

class WatchViewModel: NSObject, ObservableObject, WCSessionDelegate {
    
    @Published var text: String = ""
    var wcSession: WCSession!
    
    override init() {
        super.init()
        willActivate()
    }
    
//   func setupWCSession() {
//        if WCSession.isSupported() {
//            wcSession = WCSession.default
//            wcSession.delegate = self
//            wcSession.activate()
//        }
//    }
        func willActivate() {
            if WCSession.isSupported() {
                wcSession = WCSession.default
                wcSession.delegate = self
                wcSession.activate()
            }
        }
    func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
        if let text = message["message"] as? String {
            print(text)
            DispatchQueue.main.async {
                self.text = text
            }
        }
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        // Handle activation completion if needed.
    }
}




//import Foundation
//import WatchConnectivity
//import SwiftUI
//
//class PhoneConnector:NSObject,ObservableObject {
//
//    // public variables
//
//    static let shared = PhoneConnector()
//
//    public let session = WCSession.default
//
//    @Published var users:[User] = []
//
//    private override init() {
//        super.init()
//        if WCSession.isSupported() {
//            session.delegate = self
//            session.activate()
//        }
//    }
//
//}
//
//// MARK: - WCSessionDelegate methods
//extension PhoneConnector:WCSessionDelegate {
////    #if os(watchOS)
////    func sessionDidBecomeInactive(_ session: WCSession) {
////        print("poiuytr")
////    }
////
////    func sessionDidDeactivate(_ session: WCSession) {
////        print("qwertyui")
////    }
////    #endif
//
//    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
//        if let error = error {
//            print("session activation failed with error: \(error.localizedDescription)")
//            return
//        }
//    }
//
//    func session(_ session: WCSession, didReceiveUserInfo userInfo: [String : Any] = [:]) {
//        print("Recieved user")
//        dataReceivedFromPhone(userInfo)
//    }
//
//    // MARK: use this for testing in simulator
//    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
//        print("Recieved message")
//        dataReceivedFromPhone(message)
//    }
//
//}
//
//
//// MARK: - send data to phone
//extension PhoneConnector {
//
//    public func sendDataToPhone(_ user:User) {
//        let dict:[String:Any] = ["data":user.encodeIt()]
//
//        //session.transferUserInfo(dict)
//        // for testing in simulator we use
//        session.sendMessage(dict, replyHandler: nil)
//    }
//
//}
//
//// MARK: - receive data
//extension PhoneConnector {
//
//    public func dataReceivedFromPhone(_ info:[String:Any]) {
//        let data:Data = info["data"] as! Data
//        let user = User.decodeIt(data)
//        DispatchQueue.main.async {
//            self.users.append(user)
//        }
//    }
//
//}
//





//import Foundation
//import WatchConnectivity
//
//class WatchViewModel: NSObject, ObservableObject, WCSessionDelegate {
//
//
//    // MARK: Variables
//    @Published var text: String = ""
//    var wcSession : WCSession!
//
//    override init() {
//           super.init()
//           setupWCSession()
//       }
//    private func setupWCSession() {
//    if WCSession.isSupported() {
//        wcSession = WCSession.default
//        wcSession.delegate = self
//        wcSession.activate()
//    }
//}
//
//func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
//    if let text = message["message"] as? String {
//        print(text)
//        DispatchQueue.main.async {
//            self.text = text
//        }
//    }
//}
//    func willActivate() {
//        wcSession = WCSession.default
//        wcSession.delegate = self
//        wcSession.activate()
//    }
//    // MARK: WCSession Methods
//
////    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
////
////        let text = message["message"] as! String
////        print(text)
////        self.text = text
////    }
//
//    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
//
//        // Code.
//
//    }
//
//}
