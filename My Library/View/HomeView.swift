//
//  Home.swift
//  My Library
//
//  Created by ACS on 24.02.2021.
//

import SwiftUI
import ChameleonFramework

struct HomeView: View {
    @State var filteredItems = books
    
    var body: some View {
        CustomNavigationView(view: AnyView(BookListView(filteredItems: $filteredItems)), title: "ACS", placeHolder: "ASFASFV",
                             onSearch: { (txt) in
                                if txt != "" {
                                    self.filteredItems = books.filter{$0.title.lowercased().contains(txt.lowercased())}
                                }else {
                                    self.filteredItems = books
                                }
                             }, onCancel: {
                                self.filteredItems = books
                             }
        )
        .ignoresSafeArea()
    }
}

struct BookListView: View {
    @Binding var filteredItems: [Book]
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 10) {
                ForEach(filteredItems) {book in
                    CardView(item: book)
                }
            }.background(Color(FlatSand()))
        }.padding(0)
        .edgesIgnoringSafeArea(.bottom)
        
        
//        ZStack {
//            Color(FlatPlum()).edgesIgnoringSafeArea(.top)
//
//        }.edgesIgnoringSafeArea(.bottom)
    }
}


