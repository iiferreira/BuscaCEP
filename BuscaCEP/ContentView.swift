//
//  ContentView.swift
//  BuscaCEP
//
//  Created by Iuri Ferreira on 28/08/25.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    let store: StoreOf<CepFeature>
    
    @FocusState var isFocused : Bool
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack(spacing: 0) {
                headerView
                searchView
                
                Spacer()
                
                ZStack {
                    switch viewStore.screenState {
                    case .loading:
                        VStack {
                            Spacer()
                            CustomProgressView()
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        .transition(.opacity)
                        
                    case .error(let error):
                        ErrorView(error: error)
                        
                    case .success:
                        ScrollView {
                            AddressView(infoCardViewModel: store.addressViewModel)
                        }
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                        
                    case .idle:
                        IdleView()
                    }
                }
                .animation(.easeInOut(duration: 0.5), value: viewStore.screenState)
            }
        }.onTapGesture {
            isFocused = false
            hideKeyboard()
        }
    }
    
    private var headerView : some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(Color.gray.opacity(0.15))
                .padding(.horizontal)
                .frame(height: 180)
            
            VStack(spacing:10) {
                Image(systemName: "magnifyingglass")
                    .font(.largeTitle)
                Text(Constants.headerViewText().title)
                    .font(.title2)
                Text(Constants.headerViewText().subtitle)
                    .foregroundStyle(.accent)
                    .font(.caption)
            }
        }
    }
    
    private var searchView: some View {
        WithViewStore(store,observe: { $0 }) { viewStore in
            VStack {
                TextField(Constants.searchViewText().placeholder,text: viewStore.binding(
                    get: \.cepAddress,
                    send: { .cepAddressChanged($0)}
                ).max(9))
                .maskedInput(text: viewStore.binding(get: \.cepAddress, send: { .cepAddressChanged($0)}), mask: "#####-###")
                .focused($isFocused)
                .keyboardType(.numberPad)
                .overlay(content: {
                    if viewStore.cepAddress.count > 0 {
                        HStack {
                            Spacer()
                            Button(action: {
                                viewStore.send(.clearCepAddressButtonTapped)
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .font(.title3)
                                    .foregroundColor(.gray)
                                    
                            }
                        }
                    }
                })
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 12).stroke(lineWidth: isFocused ? 2.0 : 1.0).foregroundStyle(.purple)
                }
                .padding()
                
                ActionButton(action: {
                    viewStore.send(.fetchCepButtonTapped)
                    isFocused = false
                    hideKeyboard()
                }, title: Constants.searchViewText().buttonTitle)
            }
        }.padding(.bottom)
    }
}

#Preview {
    ContentView(store: Store(initialState: CepFeature.State(), reducer: { CepFeature() }))
}
