//
//  Expenses.swift
//  iExpanse
//
//  Created by Enrico Sousa Gollner on 13/12/22.
//

import Foundation

class Expenses: ObservableObject{
    @Published var items = [ExpenseItem]() {
        didSet{
            if let encoded = try? JSONEncoder().encode(items){  // Archiving - Making the array a JSON
                UserDefaults.standard.set(encoded, forKey: "Items")  // Saving the data to be decoded and used when the app relaunch
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items"){
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems){
                items = decodedItems
            }
        }
        
        items = []
    }
}
