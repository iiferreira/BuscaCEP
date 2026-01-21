//
//  InfoView.swift
//  BuscaCEP
//
//  Created by Iuri Ferreira on 29/08/25.
//

import SwiftUI

struct InfoView : View {
    
    var asset : AddressViewAssets
    var title : String
    var subtitle : String
    
    var body: some View {
        ZStack {
            HStack {
                RoundedRectangle(cornerRadius: 12)
                    .frame(width: 60, height: 60, alignment: .center)
                    .foregroundStyle(.gray.opacity(0.2))
                    .overlay {
                        Image(systemName: asset.imageName)
                            .font(.title)
                            .foregroundStyle(asset.color)
                    }
                
                VStack(alignment:.leading) {
                    Spacer()
                    Text(title)
                        .fontWeight(.bold)
                        .foregroundStyle(asset.color)
                        .padding(.top)
                    Text(subtitle)
                        .fontWeight(.bold)
                        .padding(.bottom)
                    Spacer()
                }
                Spacer()
            }
        }
    }
}
