//
//  ContentView.swift
//  Project1BilgeAdam
//
//  Created by Sarper Kececi on 29.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showMainView = false
    
    var body: some View {
        NavigationView {
            ZStack {
                if showMainView {
                   PokemonList()
                } else {
                    PokemonSplashView()
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                                withAnimation {
                                    showMainView = true
                                }
                            }
                        }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
