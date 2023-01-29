//
//  SettingsView.swift
//  CalculatorApp
//
//  Created by Alexey Budynkov on 25.01.2023.
//

import SwiftUI


struct SettingsView: View {

    @EnvironmentObject private var calculatorViewModel: CalculatorViewModel
    @EnvironmentObject private var cryptoRatesviewModel: CryptoRatesViewModel

    
    var body: some View {
        Form {
            Section {
                Toggle("Addition available", isOn: $calculatorViewModel.additionIsOn)
                Toggle("Subtraction available", isOn: $calculatorViewModel.subtractionIsOn)
                Toggle("Multiplication available", isOn: $calculatorViewModel.multiplicationIsOn)
                Toggle("Division available", isOn: $calculatorViewModel.divisionIsOn)
            }
            Section("Network calls are turned off") {
                Toggle("Offline mode", isOn: $cryptoRatesviewModel.offlineMode)
            }
            Section {
                Toggle("Colored theme", isOn: $calculatorViewModel.themeSwitcher)
            }
            
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(CalculatorViewModel())
    }
}
