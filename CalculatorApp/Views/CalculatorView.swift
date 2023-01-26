//
//  CalculatorView.swift
//  CalculatorApp
//
//  Created by Alexey Budynkov on 23.01.2023.
//

import SwiftUI
import Combine

struct CalculatorView: View {

    @EnvironmentObject private var viewModel: CalculatorViewModel

    var body: some View {
        GeometryReader { proxy in
            ZStack {

                VStack {
                    Spacer()

                    // Text display
                    HStack {
                        Spacer()
                        Text(viewModel.number)
                            .font(.system(size: 32))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            
                            .lineLimit(1)
                            .minimumScaleFactor(0.2)
                    }
                    .padding()

                    HStack(spacing: 12){

                        LazyVGrid(columns: Array(repeating: GridItem(), count: 4), spacing: 0) {
                            ForEach(viewModel.buttons, id: \.self) { row in
                                
                                Button(action: {
                                    viewModel.tapAction(button: row)
                                }, label: {
                                    Text(row.description)
                                        .font(.system(size: 32))
                                        .frame(
                                            width: proxy.size.width/5,
                                            height: proxy.size.height/7
                                        )
                                        .background(row.backgroundColor)
                                        .foregroundColor(row.foregroundColor)
                                        .clipShape(Circle())
                                })
                            }
                            .padding(.bottom, 3)
                        }
                    }
                }
            }

        }
    }

}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
            .environmentObject(CalculatorViewModel())
    }
}
