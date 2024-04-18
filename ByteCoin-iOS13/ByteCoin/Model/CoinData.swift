    // This file was generated from JSON Schema using quicktype, do not modify it directly.
    // To parse the JSON, add this file to your project and do:
    //
    //   let coinData = try? JSONDecoder().decode(CoinData.self, from: jsonData)

import Foundation

    // MARK: - CoinData
struct CoinData: Codable {
    let time: String
    let assetIDBase: String
    let assetIDQuote: String
    let rate: Double
    
    enum CodingKeys: String, CodingKey {
        case time = "time"
        case assetIDBase = "asset_id_base"
        case assetIDQuote = "asset_id_quote"
        case rate = "rate"
    }
}
