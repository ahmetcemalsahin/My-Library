//
//  Home.swift
//  My Library
//
//  Created by ACS on 24.02.2021.
//

//Make a view model
//view OWN vm OWN model
//so, the info should be on vm
//and shared with binding (observable)

import SwiftUI
import ChameleonFramework

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    @State var popUpTextFields = ["","",""]
    
    init() {
        self.viewModel = HomeViewModel()
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                CustomNavigationView(view: AnyView(BookListView(viewModel: self.viewModel)), title: "Library", placeHolder: "Search for book...",
                                     onSearch: { (txt) in
                                        if txt != "" {
                                            self.viewModel.onSearch(txt)
                                        }else {
                                            self.viewModel.resetList()
                                        }
                                     }, onCancel: {
                                        self.viewModel.bookList = books
                                     }
                )
                
                
                //Add book - PopUp Screen
                if self.viewModel.flag {
                    Color.gray.opacity(0.4).edgesIgnoringSafeArea(.all)
                    VStack {
                        //Exit button
                        HStack{
                            Spacer()
                            Image(systemName: "xmark.circle")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(Color(FlatRed()).opacity(0.8))
                                .padding(4)
                                .onTapGesture {
                                    self.viewModel.flag.toggle()
                                    self.viewModel.popUpRateBook = -1
                                }
                        }
                        
                        //Book infos
                        Text("Enter book informations")
                            .foregroundColor(Color(FlatSkyBlue()))
                        ForEach(0...2, id: \.self) { index in
                            TextField(self.viewModel.popUpLabels[index], text: $popUpTextFields[index])
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .foregroundColor(Color(FlatGrayDark()))
                                .accentColor(Color(FlatSand()))
                                
                        }
                        //Rate book
                        HStack {
                            Text("Rating")
                                .padding(10)
                                .foregroundColor(Color(FlatWhite()))
                                .background(Color(FlatSkyBlue()))
                                .cornerRadius(10.0)
                            Spacer()
                            HStack {
                                ForEach(0..<5) { number in
                                    StarsView(order: number, rating: self.viewModel.popUpRateBook, starSize: 30)
                                        .onTapGesture {
                                            self.viewModel.popUpRateBook = number
                                        }
                                    Spacer()
                                }
                            }
                        }
                        .padding([.top, .bottom], 10)
                        
                        //Add to list
                        HStack {
                            Text("Add").padding(4)
                            Image(systemName: "plus.circle")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .padding(4)
                        }
                        .onTapGesture {
                            print(popUpTextFields)
                            self.viewModel.flag.toggle()
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
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 10) {
                ForEach(self.viewModel.bookList) {book in
                    CardView(item: book)
                }
            }.background(Color.white)
        }
        .padding(0)
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarItems(trailing: Button(action: {
            
            //Show pop op on tap
            self.viewModel.flag = true
        }, label: {
            Image(systemName: "plus.square.fill")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(Color(FlatWhite()))
        }))
        
    }
}
