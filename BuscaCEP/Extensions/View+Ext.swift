//
//  View+Ext.swift
//  BuscaCEP
//
//  Created by Iuri Ferreira on 02/09/25.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resolveInstanceMethod(_:)), to: nil, from: nil, for: nil)
    }
}
