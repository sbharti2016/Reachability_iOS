//
//  ContentView.swift
//  Reachability
//
//  Created by Sanjeev Bharti on 10/27/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var network = NetworkMonitor()
    
    var body: some View {
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .sheet(isPresented: $network.isNotConnected, content: {
            ErrorView()
                .presentationDetents([.fraction(0.3)])
                .interactiveDismissDisabled(true)
        })
        .padding()
    }
}

#Preview {
    ContentView()
}
