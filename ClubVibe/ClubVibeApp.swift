//
//  ClubVibeApp.swift
//  ClubVibe
//
//  Created by iMac1 on 10/02/26.
//

import SwiftUI
import FirebaseCore

@main
struct ClubVibeApp: App {
    
    @StateObject var auth = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(auth)
        }
    }
}
