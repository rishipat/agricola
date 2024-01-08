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
        "Clay": 0,
        "Reed": 0,
        "Fish": 0
    ]
    
    @State private var newResources = [
        "Cattle",
        "Grain",
        "Pig",
        "Sheep",
        "Stone-East",
        "Stone-West",
    ]
    
    @State private var round: Int = 0
    
    var body: some View {
        HStack(spacing: 10) {
            VStack(alignment: .leading, spacing: 20) {
                ForEach(0..<newResources.count, id: \.self) { index in
                    Button(action: {
                        guard index < newResources.count else { return }
                        let selectedResource = newResources.remove(at: index)
                        resources[selectedResource] = 0
                    }) {
                        Text(newResources[index])
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.blue)
                            .cornerRadius(15)
                    }
                }
                
                Spacer()
                // Provide a reset button to restore to init. state.
                Button(action: {
                    round = 0
                    newResources = [
                        "Cattle",
                        "Grain",
                        "Pig",
                        "Sheep",
                        "Stone-East",
                        "Stone-West",
                    ]
                    
                    resources = [
                        "Wood": 0,
                        "Clay": 0,
                        "Reed": 0,
                        "Fish": 0
                    ]
                    
                    
                    
                }) {
                    Text("Reset")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.red)
                        .cornerRadius(10)
                    
                }
            }
            .frame(width: 150)
            
            Divider()
            // On the right side we show the current resources and counts. Pressing the button resets the corresponding resource to 0.
            VStack {
                ForEach(resources.sorted(by: <), id: \.key) { resource, quantity in
                    Text(resource)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                    Button(action: {
                        resources[resource]? = 0
                    }) {
                        Text("\(resources[resource]!)")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding()
                            .frame(width: 200, height: 30)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(15)
                    }
                }
                
                Spacer()
                
                Text("Round # \(round)")
                
                Button(action: {
                    for resource in resources.keys {
                        if resource == "Wood" {
                            resources[resource]? += 3
                        } else {
                            resources[resource]? += 1
                        }
                    }
                    round += 1
                    
                }) {
                    Text("Next Round")
                        .font(.headline)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(15)
                }
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
