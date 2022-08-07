//
//  ShopAppApp.swift
//  ShopApp
//
//  Created by Istiaque Ahamed on 2/7/22.
//

import SwiftUI
import Firebase
import FirebaseCore

@main
struct ShopAppApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
