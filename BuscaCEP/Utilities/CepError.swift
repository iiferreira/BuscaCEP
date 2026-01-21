//
//  Error.swift
//  BuscaCEP
//
//  Created by Iuri Ferreira on 29/08/25.
//

import Foundation

enum CepError : Error {
    case invalidLength
    case invalidURL
    case invalidResponse
    case invalidCEPFormat
    case decodingFailed
    case unknow(String)
    
    var message : String {
        switch self {
        case .invalidURL:
            return "URL inválida"
        case .invalidResponse:
            return "Resposta inválida"
        case .invalidCEPFormat:
            return "CEP inválido"
        case .decodingFailed:
            return "Decodificação falhou"
        case .unknow(let message):
            return message
        case .invalidLength:
            return "O CEP deve conter 8 dígitos"
        }
    }
}

extension CepError: LocalizedError {
    var errorDescription: String? {
        return message
    }
}
