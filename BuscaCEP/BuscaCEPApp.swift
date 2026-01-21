//
//  BuscaCEPApp.swift
//  BuscaCEP
//
//  Created by Iuri Ferreira on 28/08/25.
//

import SwiftUI
import ComposableArchitecture

@main
struct BuscaCEPApp: App {
    var body: some Scene {
        WindowGroup {
            let store = Store(initialState: CepFeature.State(), reducer: { CepFeature() })
            ContentView(store: store)
        }
    }
}
