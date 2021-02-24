//
//  Home.swift
//  My Library
//
//  Created by ACS on 24.02.2021.
//

import SwiftUI

struct Home: View {
    @Binding var filteredItems: [Book]
    
    var body: some View {
        ScrollView(.vertical , showsIndicators: false) {
            VStack {
                ForEach(filteredItems) {item in
                    CardView(item: item)
                }
            }.padding()
        }
    }
}
