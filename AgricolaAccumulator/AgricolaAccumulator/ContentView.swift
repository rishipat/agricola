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
    
    @State private var prev_round: Int = 0
    @State private var prev_resources: [String: Int] = [:]
    @State private var prev_newResources: [String] = []
    
    var body: some View {
        
        HStack(spacing: 10) {
            // The left side shows new resources to select from, if available.
            VStack(alignment: .leading, spacing: 20) {
                
                
                Spacer()
                
                ForEach(0..<newResources.count, id: \.self) { index in
                    Button(action: {
                        saveState()
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
                
                Button(action: {
                    round = prev_round
                    newResources = prev_newResources
                    resources = prev_resources
                    //                    saveState()
                }) {
                    Text("Undo")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.brown)
                        .cornerRadius(10)
                    
                }
                
                Spacer()
                // Provide a reset button to restore to init. state.
                Button(action: {
                    saveState()
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
                
                
                Spacer()
                
                ForEach(resources.sorted(by: <), id: \.key) { resource, quantity in
                    Text(resource)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                    Button(action: {
                        saveState()
                        resources[resource]? = 0
                        print("test")
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
                    saveState()
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
    
    private func saveState() {
        prev_resources = resources
        prev_newResources = newResources
        prev_round = round
        print("state saved")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
