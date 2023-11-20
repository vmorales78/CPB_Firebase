//
//  CPB_FirebaseApp.swift
//  CPB_Firebase
//
//  Created by Valerie Morales on 11/6/23.
//

import SwiftUI
import FirebaseCore

@main
struct CPB_FirebaseApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
