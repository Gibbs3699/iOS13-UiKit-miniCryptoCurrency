//
//  Crypto.swift
//  Mini Crypto Currency
//
//  Created by TheGIZzz on 10/4/2565 BE.
//

import Foundation

struct Crypto: Codable {
    let data: CryptoData
}

struct CryptoData: Codable {
    let coins: [Coins]
}

struct Coins: Codable {
    let uuid: String
    let name: String
    let symbol: String
    let price: String
    let change: String
    let iconUrl: String
}

extension Crypto {
    
    static var get: Resource<Crypto> = {

        guard let url = URL(string: "https://api.coinranking.com/v2/coins") else {
            fatalError("URL is incorrect!")
        }

        return  Resource<Crypto>(url: url)

    }()
}
