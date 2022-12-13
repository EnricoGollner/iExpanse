//
//  ContentView.swift
//  iExpanse
//
//  Created by Enrico Sousa Gollner on 09/12/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    
    var body: some View{
        NavigationStack{
            List{
                ForEach(expenses.items, id: \.name){ item in
                    Text(item.name)
                }
                .onDelete(perform: removeRows)
            }
            .navigationTitle("iExpense")
            .toolbar{
                Button{
                    let expense = ExpenseItem(name: "Test", type: "Personal", amount: 7)
                    expenses.items.append(expense)
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
    
    func removeRows(at offsets: IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
