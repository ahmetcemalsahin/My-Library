//
//  CustomNavigationView.swift
//  My Library
//
//  Created by ACS on 24.02.2021.
//

import SwiftUI

struct CustomNavigationView: UIViewControllerRepresentable {
    func makeCoordinator() -> Coordinator {
        return CustomNavigationView.Coordinator(parent: self)
    }
    
    //The view which uses this custom view
    var view: AnyView
    
    let title: String
    let placeHolder: String
    
    //Closures for searching
    var onSearch: (String) -> ()
    var onCancel: () -> ()
    
    
    //init method
    init(view: AnyView, placeHolder: String? = "Search", title: String, onSearch: @escaping (String) -> (), onCancel: @escaping () -> ()) {
        self.view = view
        self.placeHolder = placeHolder!
        self.title = title
        self.onSearch = onSearch
        self.onCancel = onCancel
    }
    
    //Get NavController from UIKit
    func makeUIViewController(context: Context) -> UINavigationController {
        //SwiftUI view is required
        let childView = UIHostingController(rootView: view)
        let controller = UINavigationController(rootViewController: childView)
        
        //NavBar
        controller.navigationBar.topItem?.title = title
        controller.navigationBar.prefersLargeTitles = true
        
        //SearchBar
        let searchController = UISearchController()
        searchController.searchBar.placeholder = placeHolder
        searchController.searchBar.delegate = context.coordinator
        
        searchController.obscuresBackgroundDuringPresentation = false
        controller.navigationBar.topItem?.hidesSearchBarWhenScrolling = false
        controller.navigationBar.topItem?.searchController = searchController
        
        controller.navigationBar.topItem?.searchController?.searchBar.backgroundColor = .blue
        
        controller.navigationBar.backgroundColor = .blue
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        uiViewController.navigationBar.topItem?.title = title
        uiViewController.navigationBar.topItem?.searchController?.searchBar.placeholder = placeHolder
        uiViewController.navigationBar.prefersLargeTitles = true
    }
    
    class Coordinator: NSObject, UISearchBarDelegate {
        var parent: CustomNavigationView
        
        init(parent: CustomNavigationView) {
            self.parent = parent
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            self.parent.onSearch(searchText)
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            self.parent.onCancel()
        }
    }
}
