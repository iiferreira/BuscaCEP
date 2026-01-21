//
//  IdleView.swift
//  BuscaCEP
//
//  Created by Iuri Ferreira on 02/09/25.
//

import SwiftUI

struct IdleView : View {
    var body: some View {
        VStack {
            Spacer()
            Text(Constants.IdleViewText().title)
                .font(.title2)
                .multilineTextAlignment(.center)
                .fontWeight(.bold)
                .foregroundColor(.gray)
                .padding()
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .transition(.opacity)
    }
}

