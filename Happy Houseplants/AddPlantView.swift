//
//  AddPlantView.swift
//  Happy Houseplants
//
//  Created by Akash Mehta on 6/18/22.
//

import SwiftUI
extension NumberFormatter {
    static var currency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
}
struct AddPlantView: View {
    @State var plantName = ""
    @State var daysBetweenWatering = ""
    @State var notes = ""
    @State var dateBought = Date()
    @State var purchasePrice = ""
    
    @State var showEmptyNameError = false
    
    func savePlant() {
        if (plantName.isEmpty) {
            showEmptyNameError = true
        }
        let plant = Plant(name: plantName)
        
        if (!daysBetweenWatering.isEmpty) {
            plant.daysBetweenWatering = Int(daysBetweenWatering)
        }
        if (!notes.isEmpty) {
            plant.notes = notes
        }
        plant.dateBought = dateBought
        if(!purchasePrice.isEmpty) {
            plant.purchasePrice = Int(purchasePrice)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                TextField("Enter plant name...", text: $plantName)
                DatePicker(
                    "Bought on",
                    selection: $dateBought,
                    displayedComponents: [.date]
                )
                HStack {
                    Text("Purchase price")
                    Spacer()
                    TextField("Enter price...", text: $purchasePrice)
                        .keyboardType(.numberPad)
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                        .frame(width: 120)
                }
                
                HStack {
                    Text("Days between watering")
                    Spacer()
                    TextField("Enter days...", text: $daysBetweenWatering)
                        .keyboardType(.numberPad)
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                        .frame(width: 120)
                }
                VStack(alignment: .leading, spacing:5) {
                    Text("Notes")
                    TextEditor(text: $notes)
                }
            }
            .navigationTitle("Add a new plant")
            .listStyle(.grouped)
            .listRowInsets(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5 ))
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Save", action: savePlant)
                }
            }
            .alert(isPresented: $showEmptyNameError) { () -> Alert in
                Alert(title: Text("Plant name cannot be empty"), message: nil, dismissButton: .default(Text("OK")))
            }.preferredColorScheme(.dark)
        }
        .navigationViewStyle(.automatic).preferredColorScheme(.dark)
        .onTapGesture {
            hideKeyboard()
        }
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

struct AddPlantView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlantView()
    }
}
