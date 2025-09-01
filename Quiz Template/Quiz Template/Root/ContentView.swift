//
//  ContentView.swift
//  Quiz Template
//
//  Created by Mykyta Yankov on 01.09.2025.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    
    let store: StoreOf<AppFeature>
    
    var body: some View {
        ZStack {
            IfLetStore(self.store.scope(state: \.$destination, action: { childAction in
                    .destination(childAction)
            })) { destinationStore in
                SwitchStore(destinationStore) { initialState in
                    switch initialState {
                    case .welcomePage:
                        CaseLet(
                            \AppFeature.Destination.State.welcomePage,
                             action: AppFeature.Destination.Action.welcomePage
                        ) { childStore in
                            WelcomePageView(store: childStore)
                        }
                    }
                }
            } else: {
                SplashScreen()
            }
        }
        .onAppear {
            store.send(.onAppear)
        }
    }
}

#Preview {
    ContentView(store: Store(initialState: AppFeature.State(), reducer: {
        AppFeature()
    }))
}
