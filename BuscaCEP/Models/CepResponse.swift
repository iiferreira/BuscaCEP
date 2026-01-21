//
//  CepResponse.swift
//  BuscaCEP
//
//  Created by Iuri Ferreira on 29/08/25.
//

import Foundation

struct CepResponse : Decodable, Equatable {
    let cep, logradouro: String?
    let bairro, localidade, uf, estado: String?
    let regiao, ibge, ddd: String?
    let siafi: String?
    let erro : String?
}

extension CepResponse {
    func toViewModels() -> [AddressViewModel] {
        return [
            AddressViewModel(title: "Logradouro", subtitle: logradouro ?? "", asset: .cep),
            AddressViewModel(title: "Bairro", subtitle: bairro ?? "",asset: .bairro),
            AddressViewModel(title: "Localidade", subtitle: localidade ?? "",asset: .city),
            AddressViewModel(title: "UF", subtitle: uf ?? "", asset: .uf),
        ]
    }
}


