//
//  LoadingView.swift
//  BuscaCEP
//
//  Created by Iuri Ferreira on 02/09/25.
//

import SwiftUI

struct CustomProgressView: View {
    private let dotCount = 3
    private let colors: [Color] = [.red, .green, .blue]

    var body: some View {
        TimelineView(.animation(minimumInterval: 0.5)) { context in
            let index = Int(context.date.timeIntervalSinceReferenceDate * 2) % dotCount

            HStack(spacing: 12) {
                Spacer()
                ForEach(0..<dotCount, id: \.self) { i in
                    Circle()
                        .fill(colors[i])
                        .frame(width: 16, height: 16)
                        .opacity(index == i ? 1 : 0.3)
                        .animation(.easeInOut(duration: 0.4), value: index)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    CustomProgressView()
}
