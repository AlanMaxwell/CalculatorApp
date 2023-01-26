//
//  CryptoRates.swift
//  CalculatorApp
//
//  Created by Alexey Budynkov on 25.01.2023.
//

import SwiftUI
import Combine


struct CryptoRates: View {
    
    @ObservedObject var viewModel = CryptoRatesViewModel()
    
    var body: some View {
        Text("\(viewModel.btcRate)")
            .onAppear {
                viewModel.loadRates()
            }
    }
}

struct CryptoRates_Previews: PreviewProvider {
    static var previews: some View {
        CryptoRates()
    }
}
