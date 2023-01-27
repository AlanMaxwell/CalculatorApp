//
//  ContentView.swift
//  CalculatorApp
//
//  Created by Alexey Budynkov on 23.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var selected:Bool = true
    var body: some View {
        TabView {
            CalculatorView()
                .tabItem {
                    Image("calculator_white")
                        .renderingMode(.template)
                    Text("Calculator")
                    
                }
                .tag(1)
            
            CryptoRates()
                .tabItem {
                    
                    Image(systemName: "dollarsign")
                    Text("Exchange rate")
                }
                .tag(2)
            SettingsView()
                .tabItem {
                    
                    Image(systemName: "gearshape")
                    Text("Settings")
                }
                .tag(3)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CalculatorViewModel())
    }
}
