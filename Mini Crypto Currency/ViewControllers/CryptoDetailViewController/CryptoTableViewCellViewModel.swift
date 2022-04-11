//
//  CryptoTableViewCellViewModel.swift
//  Mini Crypto Currency
//
//  Created by TheGIZzz on 11/4/2565 BE.
//

import Foundation
import UIKit

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

    var uuid : String {
        return self.crypto.uuid
    }
    
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
    
    func percentageChangeColor() -> UIColor {
        guard let percentChange = Float(self.crypto.change) else { return .red }
        return percentChange >= 0 ? UIColor(red: 19/255, green: 188/255, blue: 36/255, alpha: 1) : .red
    }
    
    func arrowSign() -> String {
        guard let percentChange = Float(self.crypto.change) else { return ""}
        return percentChange >= 0 ? "arrow.up" : "arrow.down"
    }
}
