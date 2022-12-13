//
//  CodableView.swift
//  iExpanse
//
//  Created by Enrico Sousa Gollner on 11/12/22.
//

import SwiftUI

struct User2: Codable {
    let firstName: String
    let lastName: String
}

struct CodableView: View {
    @State private var user2 = User2(firstName: "Taylor", lastName: "Swift")
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 20){
            Text("\(user2.firstName)")
            
            Button("Save User2"){
                let encoder = JSONEncoder()
                
                if let data = try? encoder.encode(user2){
                    UserDefaults.standard.set(data, forKey: "User2Data")
                }
            }
            
            Button("Dismiss view"){
                dismiss()
            }
        }
    }
}

struct CodableView_Previews: PreviewProvider {
    static var previews: some View {
        CodableView()
    }
}
