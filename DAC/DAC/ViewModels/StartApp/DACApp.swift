//
//  DACApp.swift
//  DAC
//
//  Created by Jarret hoving on 12/03/2021.
//

import SwiftUI
import Firebase

@main
struct DACApp: App {
    //inject into swiftUI
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
