//
//  ScreenState.swift
//  BuscaCEP
//
//  Created by Iuri Ferreira on 29/08/25.
//

import Foundation

enum ScreenState : Equatable {
    case idle
    case loading
    case success
    case error(String)
}
