//
//  ContentView.swift
//  webviewpoc
//
//  Created by Palak Sharma on 05/07/23.
//

import SwiftUI
import WebKit
import JavaScriptCore
import UIKit

struct WebView: UIViewRepresentable {

    class Coordinator: NSObject, WKNavigationDelegate, WKScriptMessageHandler {
        var webView: WKWebView?

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            self.webView = webView
        }

        // receive message from wkwebview
        func userContentController(
            _ userContentController: WKUserContentController,
            didReceive message: WKScriptMessage
        ) {
            print(message.body)
            let date = Date()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.messageToWebview(msg: "hello, I got your messsage: \(message.body) at \(date)")
            }
        }

        func messageToWebview(msg: String) {
            self.webView?.evaluateJavaScript("webkit.messageHandlers.bridge.onMessage('\(msg)')")
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }

    func makeUIView(context: Context) -> WKWebView {
        let coordinator = makeCoordinator()
        let userContentController = WKUserContentController()
        userContentController.add(coordinator, name: "bridge")

        let configuration = WKWebViewConfiguration()
        configuration.userContentController = userContentController

        let _wkwebview = WKWebView(frame: .zero, configuration: configuration)
        _wkwebview.navigationDelegate = coordinator

        return _wkwebview
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        guard let path: String = Bundle.main.path(forResource: "pp", ofType: "html") else { return }
        let localHTMLUrl = URL(fileURLWithPath: path, isDirectory: false)
        webView.loadFileURL(localHTMLUrl, allowingReadAccessTo: localHTMLUrl)
    }
}



 

public struct RPIconModifier: ViewModifier {

    private let imageSize: CGSize

    private let frameSize: CGSize

    

    public init(imageSize: CGSize? = nil, frameSize: CGSize? = nil) {

        self.imageSize = imageSize ?? CGSize(width: 24, height: 24)

        self.frameSize = frameSize ?? CGSize(width: 42, height: 42)

    }

    

    public func body(content: Content) -> some View {

        VStack {

            Color.white

                .frame(width: self.frameSize.width,

                       height: self.frameSize.height)

                .clipShape(Circle())

                .shadow(radius: 5, x: 0, y: 4)

                .opacity(0.3) /// apply to the gray circle

                .overlay( /// overlay does not get affected

                    ZStack {

                        content
//                        Image("imge")

                        .frame(width: self.imageSize.width,

                               height: self.imageSize.height,

                               alignment: .center)

                    }

                )

        }

    }

}

 

//struct RPIconModifier_Previews: PreviewProvider {

//    static var previews: some View {

//        RPIconModifier()

//    }

//}

struct ContentView: View {
    var body: some View {
            VStack {
                Text("hello?")
                            WebView()
                
                
            }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
