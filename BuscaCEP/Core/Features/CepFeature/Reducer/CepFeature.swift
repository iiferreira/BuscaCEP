//
//  CepFeature.swift
//  BuscaCEP
//
//  Created by Iuri Ferreira on 28/08/25.
//

import Foundation
import ComposableArchitecture


struct CepFeature: Reducer {
    
    @Dependency(\.cepService) var cepService
    
    @ObservableState
    struct State: Equatable {
        var screenState = ScreenState.idle
        var cepAddress: String = ""
        var error: String = ""
        var cepResponse: CepResponse?
        var addressViewModel: [AddressViewModel] {
            guard let response = cepResponse else { return [] }
            return response.toViewModels()
        }
    }
    
    enum Action: Equatable {
        case fetchCepButtonTapped
        case clearCepAddressButtonTapped
        case fetchCepSucceeded(CepResponse)
        case fetchCepFailed(String)
        case cepAddressChanged(String)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                
            case .cepAddressChanged(let newValue):
                state.cepAddress = newValue
                return .none
        
            case .clearCepAddressButtonTapped:
                state.cepAddress = ""
                state.screenState = .idle
                return .none
            case .fetchCepButtonTapped:
                state.screenState = .loading
                state.error = ""
                state.cepResponse = nil
                
                return .run { [cep = state.cepAddress] send in
                    do {
                        let result = try await cepService.fetchCep(cep)
                        await send(.fetchCepSucceeded(result))
                    } catch {
                        print(error)
                        await send(.fetchCepFailed(error.localizedDescription))
                    }
                }
                
            case .fetchCepSucceeded(let cepResponse):
                state.screenState = .success
                state.cepResponse = cepResponse
                return .none
                
            case .fetchCepFailed(let error):
                state.error = error
                state.screenState = .error(error)
                return .none
            }
        }
    }
}
