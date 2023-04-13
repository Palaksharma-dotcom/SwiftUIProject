//
//  ContentView.swift
//  BasicUI
//
//  Created by Rapipay on 14/02/23.
//

import SwiftUI
//var h = 8
struct ContentView: View {
    
        @State var isActive = false
        @State var xtxt = "Ashish"
        
        var body: some View {
            
        NavigationView {
            ZStack {
                Color(.red).ignoresSafeArea()
                VStack {
                    Text(xtxt)
                    NavigationLink(destination: ScreenTwo(txt: "Screen 2"), isActive: $isActive) {
                        Button(action: {
                            isActive = true
                        }, label: {
                            Text("Next Screen")
                        })
                    }
                }.onAppear() {
                    ScreenTwo.callScreenOne = { data in
                        xtxt = data
                    }
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

