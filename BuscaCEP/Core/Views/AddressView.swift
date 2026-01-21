//
//  AddressView.swift
//  BuscaCEP
//
//  Created by Iuri Ferreira on 28/08/25.
//

import SwiftUI

struct AddressView : View {
    
    var infoCardViewModel : [AddressViewModel]
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(infoCardViewModel, id:\.self) { address in
                InfoView(asset:address.asset, title: address.title, subtitle: address.subtitle)
            }
        }.padding(.horizontal)
    }
}

