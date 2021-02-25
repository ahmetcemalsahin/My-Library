//
//  HostingController.swift
//  My Library
//
//  Created by ACS on 24.02.2021.
//

import SwiftUI

class HostingController<Content> : UIHostingController<Content> where Content : View {
    @objc override dynamic open var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

