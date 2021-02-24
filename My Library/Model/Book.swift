//
//  Book.swift
//  My Library
//
//  Created by ACS on 24.02.2021.
//

import SwiftUI

struct Book: Identifiable {
    var id = UUID().uuidString
    var title: String
    var author: String
}

var books = [
    Book(title: "Suç ve Ceza", author: "Dostoyevski"),
    Book(title: "Alamut", author: "Vladimir Bartol"),
    Book(title: "Savaş Sanatı", author: "Sun tzu"),
    Book(title: "Gazap Üzümleri", author: "John Steinbeck"),
    Book(title: "Körlük", author: "Jose Saramago"),
    Book(title: "Kendime Düşünceler", author: "Marcus Aurelius"),
    Book(title: "Beyaz Zambaklar Ülkesinde", author: "Grigoriy Petrov"),
    Book(title: "Suç ve Ceza", author: "Dostoyevski"),
    Book(title: "Alamut", author: "Vladimir Bartol"),
    Book(title: "Savaş Sanatı", author: "Sun tzu"),
    Book(title: "Gazap Üzümleri", author: "John Steinbeck"),
    Book(title: "Körlük", author: "Jose Saramago"),
    Book(title: "Kendime Düşünceler", author: "Marcus Aurelius"),
    Book(title: "Beyaz Zambaklar Ülkesinde", author: "Grigoriy Petrov")
]
