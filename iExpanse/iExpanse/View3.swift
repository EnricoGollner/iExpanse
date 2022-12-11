//
//  View3.swift
//  iExpanse
//
//  Created by Enrico Sousa Gollner on 10/12/22.
//

import SwiftUI

struct View3: View {
    @AppStorage("tapCount") private var tapCount = 0
    @Environment(\.dismiss) var dismiss
    
    var body: some View{
        VStack{
            Button("Tap count: \(tapCount)"){
                tapCount += 1
            }
            
            Button("Dismiss"){
                dismiss()
            }
        }
    }
}

struct View3_Previews: PreviewProvider {
    static var previews: some View {
        View3()
    }
}
