//
//  CardView.swift
//  My Library
//
//  Created by ACS on 24.02.2021.
//

import SwiftUI

struct CardView: View {
    var item: Book
    
    var body: some View {
        HStack(spacing: 15.0) {
            Image(systemName: "house.fill").resizable().frame(width: 65, height: 65)
            VStack {
                HStack {
                    VStack (alignment: .leading, spacing: 5, content: {
                        Text(item.title).font(.title3)
                        Text(item.author).font(.caption).foregroundColor(.gray).italic()
                    })
                    Spacer()
                }
                
            }
            Spacer()
            VStack {
                NavigationLink(destination: DetailView(item: item)) {
                    Image(systemName: "chevron.right").resizable().frame(width: 6, height: 10).foregroundColor(Color(UIColor.label))

                }
                Spacer()
            }
            //Spacer()
        }
    }
}

