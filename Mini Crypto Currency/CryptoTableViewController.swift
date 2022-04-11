//
//  CryptoTableViewController.swift
//  Mini Crypto Currency
//
//  Created by TheGIZzz on 10/4/2565 BE.
//

import Foundation
import UIKit
import SDWebImage

class CryptoTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CryptoTableViewCell.self, forCellReuseIdentifier: CryptoTableViewCell.identifier)
        
        return tableView
    }()
    
//    private var viewModels = [CryptoTableViewCellViewModel]()
    
    private var cryptoListViewModel = CryptoListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
//        WebServices.shared.getAllCryptoData { [weak self] result in
//            switch result {
//            case .success(let models):
////                let iconUrl = URL(string: models.data.coins.iconUrl.filter({ icon in }))
//
//                self?.viewModels = models.data.coins.compactMap({
//                   CryptoTableViewCellViewModel(
//                        name: $0.name,
//                        symbol: $0.symbol,
//                        price: $0.symbol,
//                        change: $0.change,
//                        iconUrl: $0.iconUrl
//                   )
//                })
//
//                DispatchQueue.main.async {
//                    self?.tableView.reloadData()
//                }
//
//                print(models.data.coins)
//            case .failure(let error):
//                print("Error: \(error)")
//            }
//        }
        
        Webservice().load(resource: Crypto.get) { [weak self] result in
            switch result {
            case .success(let models):
                self?.cryptoListViewModel.cryptoViewModel = models.data.coins.map(CryptoViewModel.init)
                self?.tableView.reloadData()
                print(models)
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel.cryptoViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CryptoTableViewCell.identifier , for: indexPath) as? CryptoTableViewCell else {
            fatalError()
        }
        
        let recipe = cryptoListViewModel.recipes[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
   
}
