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
        HStack(alignment: .top ,spacing: 15.0) {
            
            //Book image
            ZStack(alignment: .center, content: {
                Image(systemName: "book.closed").resizable().frame(width: 65, height: 80).foregroundColor(Color(FlatBlueDark()))
                Text(item.title.first!.uppercased()).foregroundColor(Color(FlatNavyBlue())).bold()
            })
            
            //Book information
            VStack (alignment: .leading, content: {
                Text(item.title).font(.title3).padding(.top, 0)
                Text(item.author).font(.footnote).foregroundColor(Color(FlatGrayDark())).bold()
                //Rating stars
                StarsView(rating: 1.5, maxRating: 5, starSize: 20.0)
            })
            Spacer()
            
            //Link Button
            VStack {
                NavigationLink(destination: DetailView(item: item)) {
                    Image(systemName: "chevron.right").resizable().frame(width: 10, height: 15).foregroundColor(.black)
                }
                Spacer()
            }
        }.padding(.vertical, 10)
        .padding(.horizontal, 20)
    }
}


//Rating stars view
struct StarsView: View {
    let rating: CGFloat
    let maxRating: Int
    let starSize: CGFloat
    
    var body: some View {
        let stars = HStack(spacing: 0) {
            ForEach(0..<maxRating) { _ in
                Image(systemName: "star.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: starSize, height: starSize)
            }
        }

        stars.overlay(
            GeometryReader { g in
                let width = rating / CGFloat(maxRating) * g.size.width
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(width: width)
                        .foregroundColor(.yellow)
                }
            }
            .mask(stars)
            )
        .foregroundColor(.gray)
    }
}

