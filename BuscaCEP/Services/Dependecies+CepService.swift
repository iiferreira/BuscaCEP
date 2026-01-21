//
//  Dependecies+LiveCepService.swift
//  BuscaCEP
//
//  Created by Iuri Ferreira on 29/08/25.
//

import ComposableArchitecture

private enum CepServiceKey: DependencyKey {
    static let liveValue: CepService = LiveCepService()
}

extension DependencyValues {
    var cepService: CepService {
        get { self[CepServiceKey.self] }
        set { self[CepServiceKey.self] = newValue }
    }
}
