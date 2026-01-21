//
//  CepService.swift
//  BuscaCEP
//
//  Created by Iuri Ferreira on 29/08/25.
//

import Foundation

protocol CepService : Sendable {
    func fetchCep(_ cep: String) async throws -> CepResponse
}
