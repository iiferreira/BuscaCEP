//
//  ActionButton.swift
//  BuscaCEP
//
//  Created by Iuri Ferreira on 21/01/26.
//

import SwiftUI

struct ActionButton : View {
    
    var action : ()->()
    var title : String
    
    var body: some View {
        Button(action: {
            action()
        }) {
            RoundedRectangle(cornerRadius: 12)
                .fill(.accent)
                .frame(height: 55)
                .padding(.horizontal)
                .overlay {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white)
                        Text(title)
                            .foregroundColor(.white)
                    }
                }
        }
    }
}

