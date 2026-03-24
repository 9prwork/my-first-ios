//
//  main-page.swift
//  my-first-ios
//
//  Created by Entronica on 24/3/2569 BE.
//

import SwiftUI


struct MainPage:View {
    
    @State private var selectedIndex = 0
    
    @ViewBuilder
    private func contentView() -> some View{
        switch(selectedIndex) {
        case 0:HomeView()
        case 1:ProfileView()
        case 2:SettingsView()
        default:HomeView()
                }
        }
    
    var body: some View {
        AppBarView()
        contentView()
        BottomNavBar(selectedIndex:$selectedIndex)

    }
    
    
}

struct AppBarView: View {
    var body: some View {
        Text("AppBar")
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.gray.opacity(0.2))
    }
}

struct BottomNavBar: View {

    @Binding var selectedIndex: Int

    var body: some View {
        HStack {
            navItem(icon: "house", index: 0)
            navItem(icon: "person", index: 1)
            navItem(icon: "gear", index: 2)
        }
        .padding()
        .background(Color.gray.opacity(0.2))
    }

    private func navItem(icon: String, index: Int) -> some View {
        Button {
            selectedIndex = index
        } label: {
            Image(systemName: icon)
                .foregroundColor(selectedIndex == index ? .blue : .gray)
                .frame(maxWidth: .infinity)
        }
    }
}


struct ProfileView: View {
    var body: some View {
        Text("Profile")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct SettingsView: View {
    var body: some View {
        Text("Settings")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


#Preview {
//    AppBarView()
    MainPage()
}



