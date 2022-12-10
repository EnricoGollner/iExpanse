//
//  View2.swift
//  iExpanse
//
//  Created by Enrico Sousa Gollner on 09/12/22.
//

import SwiftUI

struct View2: View {
    @ObservedObject var user = User()
    
    var body: some View {
        Text("\(user.firstName) \(user.lastName)")
    }
}

struct View2_Previews: PreviewProvider {
    static var previews: some View {
        View2()
    }
}
