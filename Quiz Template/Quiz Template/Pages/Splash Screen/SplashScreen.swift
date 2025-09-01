//
//  SplashScreen.swift
//  Quiz Template
//
//  Created by Mykyta Yankov on 01.09.2025.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack {
            Color.black
            
            Image(.launchLogo)
            
            ProgressView()
                .preferredColorScheme(.dark)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .padding(.bottom, 150)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SplashScreen()
}
