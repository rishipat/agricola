//
//  ContentView.swift
//  AgricolaAccumulator
//
//  Created by Rishi Patel on 1/7/24.
//

import SwiftUI

struct ContentView: View {
    @State private var resources: [String: Int] = [
        "Wood": 0,
        "Stone": 0,
        "Fish": 0
    ]
    
    var body: some View {
        VStack {
            ForEach(resources.sorted(by: <), id: \.key) { resource, quantity in
                Text(resource).font(.title)
                
                Button(action: {
                    resources[resource]? = 0
                }) {
                    Text("\(resources[resource]!)")
                        .font(.title)
                        .padding()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 50)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(20)
                }
                
                Spacer()
            }
            
            Button(action: {
                for resource in resources.keys {
                    if resource == "Wood"{
                        resources[resource]? += 3
                    }
                    else{
                        resources[resource]? += 1
                    }
                    
                }
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
