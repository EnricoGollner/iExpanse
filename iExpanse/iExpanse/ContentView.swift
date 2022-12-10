//
//  ContentView.swift
//  iExpanse
//
//  Created by Enrico Sousa Gollner on 09/12/22.
//

import SwiftUI

class User: ObservableObject{  // Classes share changes while structs don't. Everytime we create an instance of a struct, the values are unique, while in classes, they share the same data.
    
    @Published var firstName = "Bilbo"
    @Published var lastName = "Bagins"
}

struct SecondView: View{
    @Environment(\.dismiss) var dismiss
    
    let name: String
    
    var body: some View{
        Text("Hello, \(name)!")
        
        Button("Dismiss"){
            dismiss()
        }
    }
}

struct ContentView: View {
    @StateObject var user = User()
    
    @State private var showingSheet = false
    
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View{
        NavigationStack{
            VStack{
                Text("\(user.firstName) \(user.lastName)")
                
                TextField("First name", text: $user.firstName)
                TextField("Last name", text: $user.lastName)
                
                Button("Show Sheet"){
                    showingSheet.toggle()
                }
                
                List{
                    ForEach(numbers, id: \.self){
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("Add number"){
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .sheet(isPresented: $showingSheet){
                SecondView(name: user.firstName)
            }
            .navigationTitle("onDelete()")
            .toolbar{
                EditButton()
            }
        }
    }
    
    func removeRows(at offsets: IndexSet){
        numbers.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
