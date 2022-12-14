//
//  AddView.swift
//  iExpanse
//
//  Created by Enrico Sousa Gollner on 13/12/22.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expenses: Expenses  // We are sharing the one maded in content view, here.
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    let types = ["Business", "Person"]
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type){
                    ForEach(types, id: \.self){ item in
                        Text(item)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: "BRL"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Cancel"){
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        let item = ExpenseItem(name: name, type: type, amount: amount)
                        expenses.items.append(item)
                        dismiss()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())  // If we don't pass any value, it won't compile so we're adding some dummy value to fix that.
    }
}
