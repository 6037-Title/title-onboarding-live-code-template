//
//  AppFeature.swift
//  Quiz Template
//
//  Created by Mykyta Yankov on 01.09.2025.
//

import Foundation
import ComposableArchitecture

@Reducer
struct AppFeature {
    
    struct State {
        
        @PresentationState var destination: Destination.State?
        
    }
    
    enum Action {
        case onAppear
        case showWelcomePage
        
        case destination(PresentationAction<Destination.Action>)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .send(.showWelcomePage).debounce(id: "showWelcomePage", for: .seconds(2), scheduler: DispatchQueue.main)
                
            case .showWelcomePage:
                state.destination = .welcomePage(WelcomePage.State())
                return .none
                
            case .destination:
                return .none
            }
        }
        .ifLet(\.$destination, action: \.destination) {
            Destination()
        }
    }
    
}

extension AppFeature {
    
    @Reducer
    struct Destination {
    
        enum State {
            case welcomePage(WelcomePage.State)
        }
        
        enum Action {
            case welcomePage(WelcomePage.Action)
        }
        
        var body: some ReducerOf<Self> {
            Scope(state: \.welcomePage, action: \.welcomePage) {
                WelcomePage()
            }
        }
        
    }
    
}
