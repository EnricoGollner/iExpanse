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
            if let enconded = try? JSONEncoder().encode(items){  // Encoding into a JSON to be saved in UserDefaults
                UserDefaults.standard.set(enconded, forKey: "Items")
            }
        }
    }
        
    init(){
        if let savedItems = UserDefaults.standard.data(forKey: "Items"){  // Decoding to put it into the screen when the app relaunch
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems){
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}
