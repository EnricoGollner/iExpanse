//
//  ContentView.swift
//  iExpanse
//
//  Created by Enrico Sousa Gollner on 09/12/22.
//

import SwiftUI

struct ItemView: View{
    @ObservedObject var expenses: Expenses
    
    let typeWanted: String
    
    var stylingAmount: (Double) -> Color
    
    var removeRows: (IndexSet) -> Void
    
    var body: some View{
        ForEach(expenses.items){ item in
            if item.type == typeWanted{
                HStack{
                    VStack(alignment: .leading){
                        Text(item.name)
                            .font(.headline)
                        Text(item.type)
                    }
                    
                    Spacer()
                    
                    Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "BRL"))
                        .foregroundColor(stylingAmount(item.amount))
                }
            }
        }
        .onDelete(perform: removeRows)
    }
}

struct ContentView: View {
    @StateObject var expenses = Expenses()
    
    @State private var showingAddExpense = false
    
    var body: some View{
        NavigationStack{
            List{
                Section(header: Text("Personal")){
                    ItemView(expenses: expenses, typeWanted: "Personal", stylingAmount: stylingAmount, removeRows: removeRows)
                }
                
                Section(header: Text("Business")){
                    ItemView(expenses: expenses, typeWanted: "Business", stylingAmount: stylingAmount, removeRows: removeRows)
                }
            }
            .navigationTitle("iExpense")
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    EditButton()
                }
                
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        showingAddExpense = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddExpense){
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeRows(at offsets: IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
    
    func stylingAmount(amount: Double) -> Color{
        switch amount{
        case 0..<10:
            return .green
        case 11..<100:
            return .blue
        default:
            return .red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
