//
//  AsyncAwaitApp.swift
//  AsyncAwait
//
//  Created by Darya Kuliashova on 11/05/2023.
//

import SwiftUI

@main
struct AsyncAwaitApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ViewModel())
        }
    }
}
