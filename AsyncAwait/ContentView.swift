//
//  ContentView.swift
//  AsyncAwait
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.users, id: \.id) { user in
                Text(user.name)
            }
        }
        .onAppear {
            viewModel.displayUsers()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var vm = ViewModel()
    static var previews: some View {
        ContentView(viewModel: vm)
    }
}
