//
//  WebServices.swift
//  Mini Crypto Currency
//
//  Created by TheGIZzz on 10/4/2565 BE.
//

import Foundation

final class WebServices {
    static let shared = WebServices()
    
    private struct Constants {
        static let assetsEndpoint = "https://api.coinranking.com/v2/coins"
    }
    
    private init() {
    }
    
    
    // MARK: - Public
    public func getAllCryptoData(completion: @escaping (Result<Crypto, Error>) -> Void) {
        guard let url = URL(string: Constants.assetsEndpoint) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let cryptos = try JSONDecoder().decode(Crypto.self, from: data)
                completion(.success(cryptos))
            }
            
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

