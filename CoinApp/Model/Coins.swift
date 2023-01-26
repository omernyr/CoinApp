//
//  Coins.swift
//  CoinApp
//
//  Created by macbook pro on 25.01.2023.
//

import Foundation

struct CoinIcon: Codable {
    var asset_id: String
    var url: String
}

// MARK: - Coin
struct Coin: Decodable {
    var asset_id_base: String
    var rates: [Rate]
}
// MARK: - Rate
struct Rate: Decodable {
    var time, asset_id_quote: String
    var rate: Double?
}
