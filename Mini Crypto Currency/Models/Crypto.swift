//
//  Crypto.swift
//  Mini Crypto Currency
//
//  Created by TheGIZzz on 10/4/2565 BE.
//

import Foundation

struct Crypto: Decodable {
    let data: CryptoData
}

struct CryptoData: Decodable {
    let coins: [Coins]
}

struct Coins: Decodable {
    let name: String
    let symbol: String
    let price: String
    let change: String
    let iconUrl: String
}
