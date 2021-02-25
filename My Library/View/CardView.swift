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
            ZStack(alignment: .center, content: {
                Image(systemName: "book.closed").resizable().frame(width: 65, height: 65)
                Text(item.title.first!.uppercased())
            })
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
                    Image(systemName: "chevron.right").resizable().frame(width: 9, height: 14).foregroundColor(Color(UIColor.label)).padding([.trailing, .top], 4)
                }
                Spacer()
            }
        }.padding(.vertical, 7)
        .padding(.horizontal, 20)
    }
}

