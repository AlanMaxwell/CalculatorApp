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
        
        
        Text(viewModel.number)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(CalculatorViewModel())
    }
}
