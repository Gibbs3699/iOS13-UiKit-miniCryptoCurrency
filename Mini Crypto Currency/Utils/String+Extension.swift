//
//  String+Extension.swift
//  Mini Crypto Currency
//
//  Created by TheGIZzz on 11/4/2565 BE.
//

import Foundation

extension String {
    func currencyFormatting() -> String {
        if let value = Double(self) {
            let formatter = NumberFormatter()
            formatter.minimumFractionDigits = 5
            formatter.maximumFractionDigits = 5
            if let str = formatter.string(for: value) {
                return "$\(str)"
            }
        }
        return ""
    }
}
