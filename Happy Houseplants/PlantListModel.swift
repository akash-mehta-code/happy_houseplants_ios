//
//  PlantListModel.swift
//  Happy Houseplants
//
//  Created by Akash Mehta on 6/18/22.
//

import Foundation

final class PlantListModel: ObservableObject {
    private(set) var plants: [Plant] = [
        Plant(name: "Monstera Deliciosa"),
        Plant(name: "Calathea"),
        Plant(name: "String of Turtles"),
        Plant(name: "Mini Monstera"),
        Plant(name: "Monstera Adansonii")
    ]
    
    @Published var filteredPlants = [Plant]()
    
    func search(with query: String = "") {
        filteredPlants = query.isEmpty ? plants : plants.filter { $0.name.localizedCaseInsensitiveContains(query)}
    }
}
