//
//  HomeViewModel.swift
//  My Library
//
//  Created by ACS on 26.02.2021.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var bookList = books
    @Published var flag = false
    @Published var popUpRateBook: Int = -1
    
    let popUpLabels = ["Title", "Author", "Number of pages"]
    
    func onSearch(_ txt: String) {
        self.bookList = books.filter{$0.title.lowercased().contains(txt.lowercased())}
    }
    
    func resetList() {
        self.bookList = books
    }
}
