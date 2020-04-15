//: A UIKit based Playground for presenting user interface
  
import UIKit
import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello A")
                .font(.largeTitle).bold().foregroundColor(.green)
            Text("Hello B")
                .font(.largeTitle).bold().foregroundColor(.green)
            Text("Hello C")
                .font(.largeTitle).bold().foregroundColor(.green)
        }
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = UIHostingController(rootView: ContentView())
