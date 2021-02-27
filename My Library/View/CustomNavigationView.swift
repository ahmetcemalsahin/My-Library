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
        
        //Need a SwiftUI View
        let childView = UIHostingController(rootView: view)
        let navController = UINavigationController(rootViewController: childView)
        
        //NavBar Data
        navController.navigationBar.prefersLargeTitles = true
        navController.navigationBar.topItem?.title = title
        
        
        //Nav+Status Bar appearance
        let appearance = UINavigationBarAppearance()
        //Background color of the navigation and status bar
        appearance.backgroundColor = FlatBlue()
        //Color when the title is large
        appearance.largeTitleTextAttributes.updateValue(FlatWhite(), forKey: NSAttributedString.Key.foregroundColor)
        //Color when the title is small
        appearance.titleTextAttributes.updateValue(FlatWhite(), forKey: NSAttributedString.Key.foregroundColor)

        
        //Change the background- and title foregroundcolor for navigationbar
        navController.navigationBar.standardAppearance = appearance
        navController.navigationBar.scrollEdgeAppearance = appearance
        navController.navigationBar.compactAppearance = appearance
        
        
        //Search Bar init
        let searchController = UISearchController()
        searchController.searchBar.placeholder = placeHolder
        searchController.searchBar.delegate = context.coordinator
        
        searchController.obscuresBackgroundDuringPresentation = false
        
        
        //Search Bar color
        searchController.searchBar.backgroundColor = FlatBlue()
        searchController.searchBar.barTintColor = FlatRed()
        searchController.searchBar.tintColor = FlatGray()
        searchController.searchBar.searchTextField.attributedPlaceholder = NSAttributedString.init(string: placeHolder, attributes: [NSAttributedString.Key.foregroundColor: FlatGray()])
        searchController.searchBar.searchTextField.backgroundColor = FlatWhite()

        
        //Search bar is not hidden when scroll
        navController.navigationBar.topItem?.hidesSearchBarWhenScrolling = false
        //Search bar is at the top
        navController.navigationBar.topItem?.searchController = searchController
        
        return navController
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        
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
