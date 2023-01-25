//
//  CalculatorView.swift
//  CalculatorApp
//
//  Created by Alexey Budynkov on 23.01.2023.
//

import SwiftUI
import Combine

struct CalculatorView: View {

    @ObservedObject var viewModel = CalculatorViewModel()

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)

                VStack {
                    Spacer()

                    // Text display
                    HStack {
                        Spacer()
                        Text(viewModel.number)
                            .padding()
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .font(.system(size: 88, weight: .light))
                            .lineLimit(1)
                            .minimumScaleFactor(0.2)
                    }
                    .padding()
                    .frame(
                        height: proxy.size.height/7
                    )

                    HStack(spacing: 12){

                        LazyVGrid(columns: Array(repeating: GridItem(), count: 4)) {
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
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
