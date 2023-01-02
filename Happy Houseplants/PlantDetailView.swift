//
//  PlantDetailView.swift
//  Happy Houseplants
//
//  Created by Akash Mehta on 6/19/22.
//

import SwiftUI

struct PlantDetailView: View {
    let plant: Plant
    
    var body: some View {
        NavigationView {
            List {
                if let purchasePrice = plant.purchasePrice {
                    HStack {
                        Text("Purchase price")
                        Spacer()
                        Text("$\(purchasePrice)")
                            .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                            .frame(width: 120)
                    }
                }
            }
            .navigationTitle(plant.name)
            .listStyle(.grouped)
            .listRowInsets(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5 ))
            .preferredColorScheme(.dark)
        }
        .preferredColorScheme(.dark)
    }
}

struct PlantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlantDetailView(plant: Plant(name: "Monstera"))
    }
}
