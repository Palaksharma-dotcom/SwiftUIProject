//
//  ContentView.swift
//  WatchOsProject
//
//  Created by Palak Sharma on 09/08/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = PhoneViewModel()
    var body: some View {
        VStack {
            VStack{
                Text(viewModel.logs)
                Text("Send Data")
                    .font(.headline)
                Button("send", action: {
                    viewModel.sendMsg()
                })
            }
        }.onAppear {
            viewModel.willActivate()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
