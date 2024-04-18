//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    
    func didUpdateCoinData(bitcoinData: CoinData)
    func didFailWithError(error: String)
}

struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "5F379103-FBF1-4A7E-88B8-9A60079D1B42"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func fetchBitcoinData(with selectedCurrency: String) {
        print("Selected Currency: \(selectedCurrency)")
        let finalURLString = "https://rest.coinapi.io/v1/exchangerate/BTC/\(selectedCurrency)?apikey=\(apiKey)"
        performRequest(with: finalURLString)
    }
    
    func performRequest(with finalUrl: String) {
        if let url = URL(string: finalUrl) {
            let session = URLSession.shared
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error ?? "Perform Request Error")
                }
                
                if let safeData = data {
                    if let parsedData = parseJSON(safeData) {
                        if delegate != nil {
                            self.delegate?.didUpdateCoinData(bitcoinData: parsedData)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ dataToParse: Data) -> CoinData? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(CoinData.self, from: dataToParse)
            let time = decodedData.time
            let coinType = decodedData.assetIDBase
            let currencyName = decodedData.assetIDQuote
            let lastPrice = decodedData.rate
            let bitcoinData = CoinData(time: time, assetIDBase: coinType, assetIDQuote: currencyName, rate: lastPrice)
            return bitcoinData
            
        } catch let error{
            delegate?.didFailWithError(error: error.localizedDescription)
            return nil
        }
    }
}
