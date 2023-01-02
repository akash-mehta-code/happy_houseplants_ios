//
//  Plant.swift
//  Happy Houseplants
//
//  Created by Akash Mehta on 6/17/22.
//

import Foundation

class Plant {
    var name: String
    var wateringDates: [Date] = [Date]()
    var daysBetweenWatering: Int? = nil
    var notes: String = ""
    var dateBought:Date? = nil
    var purchasePrice:Int? = nil
    
    init(name: String) {
        self.name = name
    }
    
    func getDaysUntilNextWatering() -> Int {
        var daysUntilNextWatering = 0;
        if let daysBetweenWatering = self.daysBetweenWatering {
            if let lastWateringDate = self.wateringDates.last {
                if let daysSinceLastWatering = Calendar.current.dateComponents([.day], from: lastWateringDate).day {
                    daysUntilNextWatering = daysBetweenWatering - daysSinceLastWatering
                }
            }
        }
        return daysUntilNextWatering
    }
}
