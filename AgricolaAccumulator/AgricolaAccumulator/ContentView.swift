////
////  ContentView.swift
////  AgricolaAccumulator
////
////  Created by Rishi Patel on 1/7/24.
////

import SwiftUI

struct ContentView: View {
//    @State private var count :Int = 1
    @State private var resources: [String: Int] = [
        "Wood": 0,
        "Stone": 0,
        "Food": 0
    ]
    
    var body: some View {
        VStack {
            
            Text("Wood").font(.title)
            
            Button(action: {
                resources["Wood"]? = 0
            }) {
                Text("\(resources["Wood"]!)")
                    .font(.title)
                    .padding()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 50)
                    .foregroundColor(.white)
                    .background(Color.brown)
                    .cornerRadius(20)
            }
            
            Spacer()
            
            Button(action: {
                resources["Wood"]? += 1 // Incrementing count for "Next Round"
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
