//
//  ErrorView.swift
//  Reachability
//
//  Created by Sanjeev Bharti on 10/27/23.
//

import SwiftUI

struct ErrorView: View {
    
    var body: some View {
        
        ZStack {
            LottieView(name: "cat", loopMode: .loop)
            VStack {
                Spacer()
                Text("No Internet Connection")
                    .fontDesign(.rounded)
                    .fontWeight(.semibold)
                    .foregroundStyle(.red)
            }
        }
    }
}

#Preview {
    ErrorView()
        .frame(height: 150)
}
