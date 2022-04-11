//
//  CryptoDetailViewModel.swift
//  Mini Crypto Currency
//
//  Created by TheGIZzz on 11/4/2565 BE.
//

import Foundation
import UIKit

class CryptoDetailListViewModel {

    var cryptoDetailViewModel: [CryptoDetailViewModel]

    init() {
        self.cryptoDetailViewModel = [CryptoDetailViewModel]() //empty array
    }
}

extension CryptoDetailListViewModel {
    func cryptoDetailViewModel(at index: Int) -> CryptoDetailViewModel {
        return self.cryptoDetailViewModel[index]
    }
}

struct CryptoDetailViewModel {
    let cryptoDetail: CoinDetail
}

extension CryptoDetailViewModel {
    
    var name : String {
        return self.cryptoDetail.name
    }

    var symbol : String {
        return self.cryptoDetail.symbol
    }
    
    var description : String {
        return self.cryptoDetail.description
    }
    
    var color : String {
        return self.cryptoDetail.color
    }
    
    var price : String {
        return self.cryptoDetail.price
    }

    var marketCap : String {
        return self.cryptoDetail.marketCap
    }
    
    var iconUrl : String {
        return self.cryptoDetail.iconUrl
    }
}
