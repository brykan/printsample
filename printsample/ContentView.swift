//
//  ContentView.swift
//  printsample
//
//  Created by Bryan Evans on 10/25/24.
//

import SwiftUI
import WebKit
struct ContentView: View {
    var printableView = HiddenWebView(url: "https://www.barclaycardus.com/applycontent/frictionlessAppTnCs.jsp?tnc=tc45850", webView: WKWebView())
    var body: some View {
        VStack {
            Button("Print",  action: {
                printableView.print()
            })
            printableView
                .frame(width: 0, height: 0)
        }
        .padding()
    }
}
struct HiddenWebView: UIViewRepresentable {
  let url: String
  @State var webView: WKWebView
  func makeUIView(context: Context) -> WKWebView {
    webView = WKWebView()
    webView.load(URLRequest(url: URL(string: url)!))
    return webView
  }
  func updateUIView(_ uiView: WKWebView, context: Context) {}
  func print() {
    let webviewPrint = webView.viewPrintFormatter()
    let printInfo = UIPrintInfo(dictionary: nil)
    printInfo.jobName = "page"
    printInfo.outputType = .general
    let printController = UIPrintInteractionController.shared
    printController.printInfo = printInfo
    printController.showsNumberOfCopies = false
    printController.printFormatter = webviewPrint
    printController.present(animated: true, completionHandler: nil)
  }
   
}
#Preview {
    ContentView()
}
