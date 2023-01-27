//
//  CryptoRatesViewModel.swift
//  CalculatorApp
//
//  Created by Alexey Budynkov on 26.01.2023.
//

import Foundation
import Combine
import UIKit
import NetworkLayer

typealias CurrenciesRates = [String:CryptoRate]

class CryptoRatesViewModel:ObservableObject {
    
    let resource = "https://blockchain.info/ticker"
    let network = NetworkLayer()
    
    private var cancellables = Set<AnyCancellable>()


    @Published var rates:CurrenciesRates = [:]
    @Published var errorMessage: String = ""
    
    var btcRate: String {
        if rates.count == 0{
            return "No date"
        }
        
        if rates["USD"] != nil {
            return "₿(1)=\(rates["USD"]!.m15) \(rates["USD"]!.symbol)"
        }
        else{
            return "There is no dollar -> BTC in this resource"
        }
    }
    
    
    private func fetchDictionary(resource: String) -> AnyPublisher<CurrenciesRates, Error> {
        guard let url = URL(string: resource) else {
            return Fail(error: ServiceError.invalidURL).eraseToAnyPublisher()
        }
        
        return network.fetchJSON(from: url)
    }
    
    func loadRates() {
        fetchDictionary(resource: resource)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.handleError(error)
                }
            }, receiveValue: { [weak self] dict in
                
                self?.rates = dict
                self?.errorMessage = ""
            })
            .store(in: &cancellables)
    }
    
    
    private func handleError(_ error: Error) {
        switch error {
        case ServiceError.invalidURL:
            errorMessage = "Invalid URL"
        case ServiceError.noInternetConnection:
            errorMessage = "No internet connection"
        case ServiceError.requestTimeout:
            errorMessage = "Request timeout"
        case ServiceError.networkError:
            errorMessage = "Network error"
        case ServiceError.statusCodeError(let code):
            errorMessage = "Error with status code: \(code ?? 0)"
        default:
            errorMessage = "Unexpected error"
        }
        
        print("\(errorMessage):\(error.localizedDescription)")
        showAlert(message: "\(errorMessage):\(error.localizedDescription)")
    }
    
    
    func showAlert(message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            let keywindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            
            if keywindow != nil {
                var topController:UIViewController? = keywindow!.rootViewController
                if topController != nil{
                    while (topController!.presentedViewController != nil) {
                        topController = topController!.presentedViewController!
                    }
                    
                    if !(topController is UIAlertController){
                        topController!.present(alert, animated: true, completion: nil)
                    }
                    
                }
            }
        }
    }
    
}
