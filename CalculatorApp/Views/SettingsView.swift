//
//  SettingsView.swift
//  CalculatorApp
//
//  Created by Alexey Budynkov on 25.01.2023.
//

import SwiftUI


struct SettingsView: View {

    @EnvironmentObject private var viewModel: CalculatorViewModel

    var body: some View {
        Form {
            Section {
                Toggle("Addition available", isOn: $viewModel.additionIsOn)
                Toggle("Subtraction available", isOn: $viewModel.subtractionIsOn)
                Toggle("Multiplication available", isOn: $viewModel.multiplicationIsOn)
                Toggle("Division available", isOn: $viewModel.divisionIsOn)
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
