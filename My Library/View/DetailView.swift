//
//  DetailView.swift
//  My Library
//
//  Created by ACS on 24.02.2021.
//

import SwiftUI

struct DetailView: View {
    var item: Book
    var body: some View {
        Text(item.title)
    }
}
