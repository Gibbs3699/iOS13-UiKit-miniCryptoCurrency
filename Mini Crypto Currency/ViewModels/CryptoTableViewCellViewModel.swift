//
//  CryptoTableViewCellViewModel.swift
//  Mini Crypto Currency
//
//  Created by TheGIZzz on 11/4/2565 BE.
//

import Foundation

class CryptoListViewModel {

    var cryptoViewModel: [CryptoViewModel]

    init() {
        self.cryptoViewModel = [CryptoViewModel]() //empty array
    }
}

extension CryptoListViewModel {
    func cryptoViewModel(at index: Int) -> CryptoViewModel {
        return self.cryptoViewModel[index]
    }
}

struct CryptoViewModel {
    let crypto: Coins
}

extension CryptoViewModel {

    var name : String {
        return self.crypto.name
    }

    var symbol : String {
        return self.crypto.symbol
    }

    var price : String {
        return self.crypto.price
    }

    var change : String {
        return self.crypto.change
    }
    
    var iconUrl : String {
        return self.crypto.iconUrl
    }
}
