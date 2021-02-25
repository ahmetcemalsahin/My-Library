//
//  CustomNavigationView.swift
//  My Library
//
//  Created by ACS on 24.02.2021.
//

import SwiftUI
import ChameleonFramework

struct CustomNavigationView: UIViewControllerRepresentable {
    //The view which needs searchBar
    var view: AnyView
    
    //NavBar title
    var title: String
    
    //SearchBar placeholder
    var placeHolder: String
    
    //Closures about searchBar
    var onSearch: (String)->()
    var onCancel: ()->()
    
    
    init(view: AnyView, title: String, placeHolder: String? = "Search...", onSearch: @escaping (String)->(), onCancel: @escaping ()->()) {
        self.view = view
        self.title = title
        self.placeHolder = placeHolder!
        self.onSearch = onSearch
        self.onCancel = onCancel
    }
    
    func makeUIViewController(context: Context) -> UINavigationController {
        let childView = UIHostingController(rootView: view)
        
        let navController = UINavigationController(rootViewController: childView)
        navController.navigationBar.prefersLargeTitles = true
        navController.navigationBar.topItem?.title = title
        
        let appearance = UINavigationBarAppearance()
        //background color of the navigation and status bar
        appearance.backgroundColor = FlatPlum()
        //color when the title is large
        appearance.largeTitleTextAttributes.updateValue(FlatOrange(), forKey: NSAttributedString.Key.foregroundColor)
        //color when the title is small
        appearance.titleTextAttributes.updateValue(FlatOrange(), forKey: NSAttributedString.Key.foregroundColor)

        // change the background- and title foregroundcolor for navigationbar
        navController.navigationBar.standardAppearance = appearance
        navController.navigationBar.scrollEdgeAppearance = appearance
        navController.navigationBar.compactAppearance = appearance
        
        let searchController = UISearchController()
        searchController.searchBar.placeholder = placeHolder
        searchController.searchBar.delegate = context.coordinator
        
        searchController.obscuresBackgroundDuringPresentation = false
        
        searchController.searchBar.backgroundColor = FlatPlum()
        searchController.searchBar.tintColor = FlatOrange()
        
        navController.navigationBar.topItem?.hidesSearchBarWhenScrolling = false
        navController.navigationBar.topItem?.searchController = searchController
        
        navController.navigationBar.backgroundColor = FlatPlum()
        navController.navigationBar.tintColor = FlatOrange()
        
        return navController
        
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        uiViewController.navigationBar.backgroundColor = FlatPlum()
        uiViewController.navigationBar.tintColor = FlatOrange()
    }
    
    func makeCoordinator() -> Coordinator {
        return CustomNavigationView.Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UISearchBarDelegate {
        var parent: CustomNavigationView
        
        init(parent: CustomNavigationView) {
            self.parent = parent
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            parent.onSearch(searchText)
        }
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            parent.onCancel()
        }
    }
}
