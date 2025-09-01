//
//  WelcomePage.swift
//  Quiz Template
//
//  Created by Mykyta Yankov on 01.09.2025.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct WelcomePage {
    
    struct State: Equatable {
        
    }
    
    enum Action {
        case onAppear
        
        case tap(Tap)
        enum Tap {
            case `continue`
        }
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .none
                
            case .tap(.continue):
                print("Continue tapped")
                return .none
            }
        }
    }
    
}

struct WelcomePageView: View {
    
    let store: StoreOf<WelcomePage>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack(alignment: .center, spacing: 61) {
                Spacer()
                
                Text("Online Personal\nStyling.\nOutfits for\nEvery Woman.")
                    .foregroundStyle(.white)
                    .font(.kaisei(.medium, size: 32))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 20)
                
                Button {
                    store.send(.tap(.continue))
                } label: {
                    Text("Continue".uppercased())
                        .font(.poppins(.regular, size: 14))
                        .kerning(0.5)
                        .foregroundStyle(Color(hex: "#181819"))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 13.5)
                        .background {
                            Rectangle()
                                .fill(.white)
                        }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 28)
                .buttonStyle(.plain)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                LinearGradient(
                    stops: [
                        Gradient.Stop(color: .black.opacity(0), location: 0.00),
                        Gradient.Stop(color: .black, location: 1.00),
                    ],
                    startPoint: UnitPoint(x: 0.5, y: 0.3),
                    endPoint: UnitPoint(x: 0.5, y: 0.81)
                )
                .ignoresSafeArea()
            }
            .background {
                Image(.welcome)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    WelcomePageView(store: Store(initialState: WelcomePage.State()) {
        WelcomePage()
    })
}
