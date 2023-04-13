//
//  ScreenTwo.swift
//  BasicUI
//
//  Created by Rapipay on 14/02/23.
//

import SwiftUI



struct ScreenTwo: View {
    static var callScreenOne: ((String) -> Void)?
    
    var txt: String?

    var body: some View {
        VStack {
            Text(txt ?? "Default Value")
            Button(action: {
                ScreenTwo.callScreenOne?("Called from Screen two")
            }) {
                Text("Previous Screen")
            }
        }
    }
}

struct ScreenTwo_Previews: PreviewProvider {
    static var previews: some View {
        ScreenTwo(txt: "")
    }
}
                    
