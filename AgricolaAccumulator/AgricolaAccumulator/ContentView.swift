////
////  ContentView.swift
////  AgricolaAccumulator
////
////  Created by Rishi Patel on 1/7/24.
////
//
//import SwiftUI
//
//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
//    }
//}
//
//#Preview {
//    ContentView()
//}
import SwiftUI

struct ContentView: View {
    @State private var count :Int = 1
    
    var body: some View {
        VStack {
            
            Text("Wood")
            
            Button(action: {
                count = 0
            }) {
                Text("\(count)")
                    .font(.title)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.cyan)
                    .cornerRadius(20)
            }
            
//            Button(action: {count -= 1}) {
//                Text("test")
//            }
            Spacer()
            
            Button(action: {
                count += 1 // Incrementing count for "Next Round"
            }) {
                Text("Next Round")
                    .font(.headline)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(10)
            }
            
            Spacer()
            
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
