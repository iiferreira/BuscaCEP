//
//  Constants.swift
//  BuscaCEP
//
//  Created by Iuri Ferreira on 28/08/25.
//

import Foundation

struct Constants {
    struct URLS {
        func baseURL(_ cep: String) -> String {
            return "https://viacep.com.br/ws/\(cep)/json/"
        }
    }
    
    struct headerViewText {
        var title = "Busca por qualquer CEP"
        var subtitle = "Digite o CEP e descubra o endereço completo."
    }
    
    struct searchViewText {
        var placeholder = "Digite o CEP"
        var buttonTitle = "Buscar CEP"
    }
    
    struct errorViewText {
        var errorMessage = "Algo deu errado..."
    }
    
    struct IdleViewText {
        var title = "Digite qualquer CEP para começar."
    }
}
