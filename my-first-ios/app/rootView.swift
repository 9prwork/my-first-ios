//
//  rootView.swift
//  my-first-ios
//
//  Created by Entronica on 25/3/2569 BE.
//
import SwiftUI

enum AppState{
    case splash
    case home
}


struct RootView:View {
    
    @State private var state: AppState = .splash
    var body: some View {
        switch state {
        case .splash:
            SplashView {
                withAnimation {
                    state = .home
                }
            }
        case .home:
            Text("Homepage")
        }
        
     
    }
}
