//
//  Quiz_TemplateApp.swift
//  Quiz Template
//
//  Created by Mykyta Yankov on 01.09.2025.
//

import SwiftUI
import ComposableArchitecture

@main
struct Quiz_TemplateApp: App {
    
    let store: StoreOf<AppFeature> = Store(initialState: AppFeature.State()) {
        AppFeature()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}

