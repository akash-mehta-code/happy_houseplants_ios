//
//  Happy_HouseplantsApp.swift
//  Happy Houseplants
//
//  Created by Akash Mehta on 6/17/22.
//

import SwiftUI

@main
struct Happy_HouseplantsApp: App {
    @StateObject var plantListModel = PlantListModel()

    var body: some Scene {
        WindowGroup {
            PlantListView()
                .environmentObject(plantListModel)
        }
    }
}
