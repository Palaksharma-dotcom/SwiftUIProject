//
//  ContentView.swift
//  UiSwiftProject
//
//  Created by Rapipay on 13/02/23.
//

import SwiftUI
struct Person: Identifiable{
    //       var id: ObjectIdentifier
    
    
    let givenName: String
    let familyName: String
    let emailAddress: String
    let id = UUID()
}


struct ContentView: View {
    @State private var username = ""
    @State private var space = 10.0
    @State private var name = "i"
    @State private var isActive = false
    
    private var people = [
        Person( givenName: "pineapple", familyName: "fruits", emailAddress: "asdfg"),
        Person(givenName: "lion", familyName: "animal", emailAddress: "werty")
    ]
    
    
    var body: some View {
        NavigationView{
            
            VStack {
                Spacer()
//                Image(systemName: "globe")
//                    .imageScale(.large)
//                    .foregroundColor(.accentColor)
                Spacer(minLength: 0)
                
                Table(people) {
                    TableColumn("First Name") { val in
                        NavigationLink(destination: TableDetail(), isActive: $isActive){
                            HStack{
                                Text(val.givenName).frame(width: 80, alignment: .leading)
                                Text(val.familyName).frame(width: 50)
                                Text(val.emailAddress).frame(width: 60)
                                Spacer()
                            }}
//                        .contentShape(Rectangle())
                        .onTapGesture(perform: {
                                isActive = true
                            })
                        
                        
                        //                        NavigationView{
                        //
                        //                            Slider(value: $space )
                        //                                .padding(20)
                        //                            TextField("Name", text: $username).padding(5).border(.gray,width: 2).frame(width: 100)
                        //                            NavigationLink(destination: StoryBoard1(),isActive: $isactive){
                        //
                        //                                Button(action: {
                        //                                    self.isactive = true
                        //                                }) {
                        //                                    Text("pushhh")
                        //                                }
                        //                            }
                        //
                        //                        }
                    }
                }
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
