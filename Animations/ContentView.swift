//
//  ContentView.swift
//  Animations
//
//  Created by Mich balkany on 10/31/23.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    var body: some View {
        Button("Tap Me") {
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1) * 3)
        .animation(
            .easeInOut(duration: 2)
                .repeatCount(3, autoreverses: true),
            value: animationAmount)
    }
}

#Preview {
    ContentView()
}
