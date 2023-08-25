//
//  ContentView.swift
//  WatchApp Watch App
//
//  Created by Palak Sharma on 09/08/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = WatchViewModel()
    
    var body: some View {
        VStack {
            Text(viewModel.text + "okokokokokok")
        }
        .onAppear {
            viewModel.willActivate()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
