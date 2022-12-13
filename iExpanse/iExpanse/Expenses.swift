//
//  Expenses.swift
//  iExpanse
//
//  Created by Enrico Sousa Gollner on 13/12/22.
//

import Foundation

class Expenses: ObservableObject{
    @Published var items = [ExpenseItem]()
}
