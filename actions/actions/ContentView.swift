//
//  ContentView.swift
//  actions
//
//  Created by Titov Evgeniy on 22/03/2023.
//

import SwiftUI
import StoreManager

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class ContentViewModel: ObservableObject {
    
    private let storeManager: StoreManagerProtocol

    init() {
        storeManager = StoreManager()
    }

    func fetchProducts() {
        Task {
            _ = try? await storeManager.requestProducts(productIDs: [])
        }
    }
}
