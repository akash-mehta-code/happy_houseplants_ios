//
//  ContentView.swift
//  Happy Houseplants
//
//  Created by Akash Mehta on 6/17/22.
//

import SwiftUI

struct PlantListView: View {
    @EnvironmentObject var plantListModel: PlantListModel
    @State private var query = ""
    
    var body: some View {
        NavigationView {
            List(plantListModel.filteredPlants, id: \.self.name) { plant in
                NavigationLink(destination: PlantDetailView(plant: plant), label: {
                    VStack(alignment: .leading, spacing: 1) {
                        Text(plant.name).font(.body)
                        Text("Days until next watering: \(plant.getDaysUntilNextWatering())")
                            .font(.footnote)
                    }
                })
            }
            .navigationTitle("Happy Houseplants")
            .searchable(text: $query, prompt: "Find a plant")
            .onChange(of: query) { newQuery in
                plantListModel.search(with: newQuery)
            }
            .onAppear {
                plantListModel.search()
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    NavigationLink(destination: AddPlantView()) {
                        Text("Add Plant")
                    }
                }
            }
        }
        .navigationViewStyle(.automatic).preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PlantListView()
            .previewDevice("iPhone 13 Pro")
    }
}
