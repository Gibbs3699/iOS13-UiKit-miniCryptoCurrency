//
//  CryptoDetail.swift
//  Mini Crypto Currency
//
//  Created by TheGIZzz on 11/4/2565 BE.
//

import Foundation

struct CryptoDetail: Codable {
    let data: CryptoDetailData
}

struct CryptoDetailData: Codable {
    let coin: CoinDetail
}

struct CoinDetail: Codable {
    let name: String
    let symbol: String
    let description: String
    let color: String
    let iconUrl: String
    let price: String
    let marketCap: String
}

extension CryptoDetail {

    static func getDetail(uuid: String) -> Resource<CryptoDetail?> {

        guard let url = URL(string: "https://api.coinranking.com/v2/coin/\(uuid)") else {
            fatalError("URL is incorrect!")
        }

        return  Resource<CryptoDetail?>(url: url)
    }
}

