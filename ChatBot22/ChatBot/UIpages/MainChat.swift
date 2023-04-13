//
//  MainChat.swift
//  ChatBot
//
//  Created by Rapipay on 26/03/23.
//

import SwiftUI

struct MainChat: View {
//    @State var usermsg = ""
    @ObservedObject var vm: ChatViewModel
    @ObservedObject var vmg: UserSettings
    var body: some View {
        VStack{
            ScrollView{
                ScrollViewReader{ value in
//                Text("tfghjkl")
//                LazyVStack{
//                chatviewmodel->  @Published var message: [MessageModel] = []
                
                    ForEach(vm.message, id: \.id){ msg in
                        MessageCellView(message: msg.text, sender: !(msg.sender == vm.settings.user.username), created: msg.created, date: "")
                    }.onAppear{
                        
//                        FOR LAST MESSAGE TO APPEAR ON THE SCREEN _^|\                        value.scrollTo(vm.message[vm.message.count - 1].id)

                        
                    }
                }
            }
            ZStack{
                HStack{
                    TextField("Enter Message", text: $vm.messageentered)
                        .onChange(of: vm.messageentered) {
                            data in vm.showTyping()
                        }
                    
                        .padding()
//                        .background(Color.white)
                        .onSubmit {
                            vm.sendMessages()
                        }
                    Spacer()
                    Button{
                        vm.sendMessages()
                    }label: {
                        Image(systemName: "paperplane.fill")
                    }
                    .font(.system(size: 26))
                    .padding(.horizontal, 10)
                    
                }  .background(Color.white)
                    .cornerRadius(15).padding()
                    .onAppear() {
                        vm.startSocket()
                    }
                    .onDisappear() {
                        vm.closeConnection()
                    }
                //
                    .navigationBarTitle(vm.isTyping ? "is typing" : String(vm.chat.id), displayMode: .inline)
            }
//            vmg.user.username
        }.background(Color("Lightblue"))
//        .padding(.top, 200)
//            .padding(.bottom, 300)
    }
    
  
    
    
}


//struct MainChat_Previews: PreviewProvider {
//    static var previews: some View {
//        MainChat()
//    }
//}
