//
//  LoadingView.swift
//  BuscaCEP
//
//  Created by Iuri Ferreira on 02/09/25.
//

import SwiftUI

struct CustomProgressView: View {
    @State private var visibleDotIndex: Int = 0
    private let dotCount = 3
    private let colors: [Color] = [.red, .green, .blue]

    var body: some View {
        HStack(spacing: 12) {
            Spacer()
            ForEach(0..<dotCount, id: \.self) { index in
                Circle()
                    .fill(colors[index])
                    .frame(width: 16, height: 16)
                    .opacity(visibleDotIndex == index ? 1 : 0.3)
                    .animation(.easeInOut(duration: 0.4), value: visibleDotIndex)
            }
            Spacer()
        }
        .onAppear {
            startAnimating()
        }
    }

    private func startAnimating() {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
            visibleDotIndex = (visibleDotIndex + 1) % dotCount
        }
    }
}

#Preview {
    CustomProgressView()
}
