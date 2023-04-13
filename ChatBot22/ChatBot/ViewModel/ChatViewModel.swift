//
//  ChatViewModel.swift
//  ChatBot
//
//  Created by Rapipay on 26/03/23.
//

import Foundation
class ChatViewModel: ObservableObject {
    @Published var chat: ChatModel
//    @Published var usage: UserModel
    @Published var settings: UserSettings
    @Published var messageentered = ""
    @Published var message: [MessageModel] = []
    @Published var rowdata: [ChatListRowView] = []
    @Published var isTyping = false
    
    init(chat: ChatModel, settings: UserSettings){
        self.chat = chat
        self.settings = settings
        self.loadMessages()
    }
    
    
    
//    func getTime(_ date: String) -> String {
//        return String(date[date.index(date.startIndex, offsetBy: 11)...date.index(date.startIndex, offsetBy: 15)])
//    }
//    func getDate(_ date: String) -> String {
//        return String(date[date.index(date.startIndex, offsetBy: 0)...date.index(date.startIndex, offsetBy: 10)])
//    }
    
    func loadMessages() {
        NetworkManager.shared.requestForApi(requestInfo: [
            "httpMethod": "GET",
            "domain": "chats/\(self.chat.id)/messages/",
            "requestType": .getMessages as RequestType,
            "username": self.settings.user.username,
            "userSecret": self.settings.user.secret],
            completionHandler: { data in
            guard let data = data as? [[String: Any]] else {return}
            var currentMsg: [MessageModel] = []
            for value in data {
                currentMsg.append(MessageModel(id: value["id"] as? Int ?? 0, sender: value["sender_username"] as? String ?? "Text", created: value["created"] as? String ?? "Sender", text: value["text"] as? String ?? "00:00"))
            }
            print(currentMsg.count)
//            print(chat.sender)
            self.message = currentMsg
            print(self.message.count)
        })
    }
    func showTyping() {
        NetworkManager.shared.requestForApi(requestInfo: [
            "httpMethod": "POST",
            "domain": "chats/\(self.chat.id)/typing/",
            "requestType": .typing as RequestType,
            "username": self.settings.user.username,
            "userSecret": self.settings.user.secret],
            completionHandler: { data in
            
        })
    }
    func sendMessages() {
        if messageentered.count == 0 {
            return
        }
        NetworkManager.shared.requestForApi(requestInfo: [
            "httpMethod": "POST",
            "domain": "chats/\(self.chat.id)/messages/",
            "requestType": .getMessages as RequestType,
            "username": self.settings.user.username,
            "userSecret": self.settings.user.secret,
            "httpBody": ["text": self.messageentered]],
            completionHandler: { data in
            print(data)
                guard let data = data as? [String: Any] else {return}
            self.message.append(MessageModel(id: data["id"] as? Int ?? 0, sender: data["sender_username"] as? String ?? "Sender", created: data["created"] as? String ?? "00", text: data["text"] as? String ?? "palak"))
        })
        messageentered = ""
    }
    func closeConnection() {
        WSManager.shared.close()
    }
    func updateTyping() {
        if self.isTyping != true {
            self.isTyping = true
            DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                self.isTyping = false
            }
        }
    }
//    func startSocket() {
//        WSManager.shared.setupConnection(chatId: String(chat.id), chatAccessKey: chat.accessKey) { data in
//            guard let action = data["action"] as? String else { return }
//            switch action {
//            case "new_message":
//                guard let value = data["data"] as? [String: Any], let msg = value["message"] as? [String: Any], let sender = msg["sender_username"] as? String else { return }
//                guard sender != self.settings.user.username else { return }
//                self.message.append(MessageModel(id: msg["id"] as? Int ?? 0, sender: sender, created: msg["created"] as? String ?? "00:00", text: msg["text"] as? String ?? "Text"))
//            case "is_typing":
//                guard let value = data["data"] as? [String: Any], let person = value["person"] as? String else { return }
//                guard person != self.settings.user.username else { return }
//                self.updateTyping()
//            default:
//                break
//            }
//        }
//    }
    func startSocket() {
        WSManager.shared.setUpConnection(chatId: String(chat.id), chatAccessKey: chat.accessKey) { [weak self] result in
            print("Recieved:::::: \(result)")
            print(self?.chat.accessKey)
            guard let result = result.toJSON() as? [String: Any] else {return}
//            guard let self = self else { return }
//            switch result {
//            case .success(let data):
//                guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return }
//                guard let action = json["action"] as? String else { return }
            
            guard let action = result["action"] as? String else { return }
                switch action {
                case "new_message":
                    guard let messageData = result["data"] as? [String: Any], let message = messageData["message"] as? [String: Any] else { return }
                    guard let sender = message["sender_username"] as? String, sender != self?.settings.user.username else { return }
                    let messageModel = MessageModel(id: message["id"] as? Int ?? 0,
                                                    sender: sender,
                                                    created: message["created"] as? String ?? "00:00",
                                                    text: message["text"] as? String ?? "Text")
                    self?.message.append(messageModel)

                case "is_typing":
                    guard let typingData = result["data"] as? [String: Any], let person = typingData["person"] as? String, person != self!.settings.user.username else { return }
                    self?.updateTyping()

                default:
                    break
                }
            }
        }
    }

//    func startSocket() {
//        WSManager.shared.setupConnection(chatId: String(chat.id), chatAccessKey: chat.accessKey, completionHandler: { data in
//            print(data)
//            guard let data = data.toJSON() as? [String: Any] else {return}
//            switch ((data["action"] as! String)) {
//            case "new_message":
//                guard let value = data["data"] as? [String: Any] else {return}
//                guard let msg = value["message"] as? [String: Any] else {return}
//                if self.settings.user.username != msg["sender_username"] as? String ?? "username" {
//                    self.message.append(MessageModel(id: msg["id"] as? Int ?? 0, sender: msg["sender_username"] as? String ?? "Sender", created: msg["created"] as? String ?? "00:00", text: msg["text"] as? String ?? "Text"))
//                }
//            case "is_typing":
//                guard let value = data["data"] as? [String: Any] else {return}
//                if self.settings.user.username != value["person"] as! String {
//                    self.updateTyping()
//                }
//            default:
//                break
//            }
//        })
//    }

extension String {
    func toJSON() -> Any? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
}


//crazy rich asian
//
