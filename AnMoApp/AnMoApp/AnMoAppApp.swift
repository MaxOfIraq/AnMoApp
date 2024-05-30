//
//  AnMoAppApp.swift
//  AnMoApp
//
//  Created by Ahmed Salah on 26/05/2024.
//

import SwiftUI
import Firebase
@main
struct AnMoAppApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
