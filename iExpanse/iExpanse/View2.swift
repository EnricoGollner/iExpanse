//
//  View2.swift
//  iExpanse
//
//  Created by Enrico Sousa Gollner on 09/12/22.
//

import SwiftUI

struct View2: View {
    @ObservedObject var user = User()
    
    @Environment(\.dismiss) var dismiss
    
    let name: String
    
    var body: some View {
        VStack(spacing: 20){
            Text("\(user.firstName) \(user.lastName)")
            
            Button("Dismiss"){
                dismiss()
            }
        }
    }
}

struct View2_Previews: PreviewProvider {
    static var previews: some View {
        View2()
    }
}
