//
//  FlowApp.swift
//  Flow
//
//  Created by Ahmed Alamin on 7/28/25.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

// Firebase initialization boilerplate
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    Auth.auth().useEmulator(withHost: "localhost", port: 9099)
    return true
  }
}

@main
struct FlowApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            AuthenticatedView {
                ContentView()
            }
        }
    }
}
