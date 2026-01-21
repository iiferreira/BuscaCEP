//
//  InfoCardViewViewModel.swift
//  BuscaCEP
//
//  Created by Iuri Ferreira on 29/08/25.
//

import SwiftUI

enum AddressViewAssets : String, CaseIterable {
    case cep
    case bairro
    case uf
    case city
    
    var imageName : String {
        switch self {
        case .cep:
            return "house"
        case .bairro:
            return "building"
        case .uf:
            return "map"
        case .city:
            return "globe"
        }
    }
    
    var color : Color {
        switch self {
        case .cep:
            return .blue
        case .bairro:
            return .orange
        case .uf:
            return .green
        case .city:
            return .purple
        }
    }
}

struct AddressViewModel : Identifiable, Hashable {
    var id : String { return self.title }
    let title: String
    let subtitle: String
    let asset : AddressViewAssets
}
