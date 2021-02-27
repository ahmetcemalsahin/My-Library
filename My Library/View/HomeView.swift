//
//  Home.swift
//  My Library
//
//  Created by ACS on 24.02.2021.
//

import SwiftUI
import ChameleonFramework
import SwiftEntryKit

struct HomeView: View {
    @State var filteredItems = books
    @State var flag: Bool = false
    
    @State var popUpFields = [["Title", ""], ["Author", ""], ["Number of pages", ""]]
    @State var rating: Int = -1
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                CustomNavigationView(view: AnyView(BookListView(filteredItems: $filteredItems, flag: $flag)), title: "Library", placeHolder: "Search for book...",
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
                
                
                //Add book - PopUp Screen
                if flag {
                    Color.gray.opacity(0.4).edgesIgnoringSafeArea(.all)
                    VStack {
                        HStack{
                            Spacer()
                            Image(systemName: "xmark.circle")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(Color(FlatRed())
                                                    .opacity(0.8))
                                .padding(4)
                                .onTapGesture {
                                    self.flag.toggle()
                                    self.rating = -1
                                }
                        }
                        Text("Enter book informations")
                            .foregroundColor(Color(FlatSkyBlue()))
                        ForEach(0...2, id: \.self) { index in
                            TextField(popUpFields[index][0], text: $popUpFields[index][1])
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .foregroundColor(Color(FlatGrayDark()))
                                .accentColor(Color(FlatSand()))
                        }
                        HStack {
                            Text("Rating")
                                .padding(10)
                                .foregroundColor(Color(FlatWhite()))
                                .background(Color(FlatSkyBlue()))
                                .cornerRadius(10.0)
                            Spacer()
                            HStack {
                                ForEach(0..<5) { number in
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(rating >= number ? Color(FlatYellow()) : Color(FlatGrayDark()))
                                        .onTapGesture {
                                            self.rating = number
                                        }
                                    Spacer()
                                }
                            }
                        }
                        .padding([.top, .bottom], 10)
                        
                        HStack {
                            Text("Add").padding(4)
                            Image(systemName: "plus.circle")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .padding(4)
                        }
                        .onTapGesture {
                            
                        }
                        .padding(8)
                        .background(Color(FlatGreen()).opacity(0.8))
                        .cornerRadius(15)
                        .foregroundColor(Color(FlatWhite()))
                        
                    }
                    .padding(15)
                    .background(Color(FlatWhite()))
                    .cornerRadius(15)
                    .frame(width: geo.self.size.width-50)
                }
            }
            .ignoresSafeArea()
        }
    }
}

struct BookListView: View {
    @Binding var filteredItems: [Book]
    @Binding var flag: Bool
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 10) {
                ForEach(filteredItems) {book in
                    CardView(item: book)
                }
            }.background(Color.white)
        }
        .padding(0)
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarItems(trailing: Button(action: {
            
            //Show pop op on tap
            self.flag = true
        }, label: {
            Image(systemName: "plus.square.fill")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(Color(FlatWhite()))
        }))
        
    }
}
