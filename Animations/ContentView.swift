//
//  ContentView.swift
//  Animations
//
//  Created by Mich balkany on 10/31/23.
//

import SwiftUI

struct ContentView: View {
    let letters = Array("hello swiftUI")
    
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<letters.count, id: \.self) { num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? .blue : .red)
                    .offset(dragAmount)
                    .animation(.linear.delay(Double(num) / 20), value: dragAmount)
            }
        }
        // this will give the drag motion effect
        .gesture(
        DragGesture()
            .onChanged { dragAmount = $0.translation }
            .onEnded { _ in
                dragAmount = .zero
                enabled.toggle()
            }
        )
    }
}

#Preview {
    ContentView()
}
