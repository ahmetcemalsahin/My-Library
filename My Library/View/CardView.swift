//
//  CardView.swift
//  My Library
//
//  Created by ACS on 24.02.2021.
//

import SwiftUI
import ChameleonFramework

struct CardView: View {
    var item: Book
    
    var body: some View {
        HStack(spacing: 15.0) {
            ZStack(alignment: .center, content: {
                Image(systemName: "book.closed").resizable().frame(width: 65, height: 65).foregroundColor(Color(FlatBlueDark()))
                Text(item.title.first!.uppercased()).foregroundColor(Color(FlatNavyBlue())).bold()
            })
            VStack {
                HStack {
                    VStack (alignment: .leading, spacing: 5, content: {
                        Text(item.title).font(.title3)
                        Text(item.author).font(.footnote).foregroundColor(Color(FlatGrayDark())).bold()
                    })
                    Spacer()
                }
                
            }
            Spacer()
            VStack {
                NavigationLink(destination: DetailView(item: item)) {
                    Image(systemName: "chevron.right").resizable().frame(width: 10, height: 20).foregroundColor(.black).padding([.trailing, .top], 4)
                }
                Spacer()
            }
        }.padding(.vertical, 7)
        .padding(.horizontal, 20)
    }
}

