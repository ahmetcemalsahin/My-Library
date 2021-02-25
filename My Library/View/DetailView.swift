//
//  DetailView.swift
//  My Library
//
//  Created by ACS on 24.02.2021.
//

import SwiftUI
import ChameleonFramework

struct DetailView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var item: Book
    
    var body: some View {
        NavigationView {
            Text(item.author)
        }.navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle(item.title)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.mode.wrappedValue.dismiss()
        }, label: {
            HStack {
                Image(systemName: "chevron.backward")
                    .frame(width: 10, height: 20)
                    .foregroundColor(Color(UIColor.label))
            }
        }))
        
    }
}
