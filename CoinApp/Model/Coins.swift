//
//  Coins.swift
//  CoinApp
//
//  Created by macbook pro on 25.01.2023.
//

import Foundation

struct Coins: Codable {
    var asset_id, name: String
    var type_is_crypto, data_symbols_count: Int
    var data_quote_start, data_quote_end, data_trade_start, data_trade_end: String?
//    var volume_1hrs_usd: Float
//    var volume_1day_usd: Float
//    var volume_1mth_usd: Float
    var price_usd: Double?
    var data_start, data_end: String?
}

struct CoinIcon: Codable {
    var asset_id: String
    var url: String
}
