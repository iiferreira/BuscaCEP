//
//  LiveCepService.swift
//  BuscaCEP
//
//  Created by Iuri Ferreira on 29/08/25.
//

import Foundation

struct LiveCepService: CepService {
    var session: URLSession = .shared

    func fetchCep(_ cep: String) async throws -> CepResponse {
        
        let cepOnlyNumbers = cep.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        if cepOnlyNumbers.count < 8 {
            throw CepError.invalidLength
        }
        
        guard let url = URL(string: Constants.URLS().baseURL(cepOnlyNumbers)) else {
            throw URLError(.badURL)
        }

        let (data, response) = try await session.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw CepError.invalidResponse
        }
        
        do {
            let cepDecoded = try JSONDecoder().decode(CepResponse.self, from: data)
            
            if cepDecoded.erro == "true" {
                throw CepError.invalidCEPFormat
            }
            
            return cepDecoded
        } catch {
            throw CepError.decodingFailed
        }
    }
}
