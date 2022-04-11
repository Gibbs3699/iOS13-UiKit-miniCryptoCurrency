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
    
    private var cryptoListViewModel = CryptoListViewModel()
    
    static var coinUUID = ""
    
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
    
        tableView.dataSource = self
        tableView.delegate = self
        
        self.tableView.sectionHeaderHeight = 70
        self.tableView.separatorStyle = .none
        
        WebServices().load(resource: Crypto.getAll) { [weak self] result in
            switch result {
            case .success(let models):
                self?.cryptoListViewModel.cryptoViewModel = models.data.coins.map(CryptoViewModel.init)
                self?.tableView.reloadData()
                print(models)
            case .failure(let error):
                print(error)
            }
        }
        
        setupRefreshControl()
        
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
        
        let cryptos = self.cryptoListViewModel.cryptoViewModel(at: indexPath.row)
        
        let url = URL(string: cryptos.iconUrl)
        let placeholderImage = UIImage(systemName: "bitcoinsign.circle.fill")
        cell.iconView.sd_setImage(with: url, placeholderImage: placeholderImage)
        cell.nameLabel.text = cryptos.name
        cell.symbolLabel.text = cryptos.symbol
        cell.priceLabel.text =  cryptos.price.currencyFormatting()
        cell.changeLabel.textColor = cryptos.percentageChangeColor()
        cell.arrowIconView.image = UIImage(systemName: cryptos.arrowSign())
        cell.arrowIconView.tintColor = cryptos.percentageChangeColor()
        cell.changeLabel.text = cryptos.change
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cryptoDetailVC = CryptoDetailViewController()
        let navVC = UINavigationController(rootViewController: cryptoDetailVC)
        let cryptos = self.cryptoListViewModel.cryptoViewModel(at: indexPath.row)
        
        CryptoTableViewController.coinUUID = cryptos.uuid
        
        present(navVC, animated: true)

    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
            headerView.backgroundColor = .white
            
            let label = UILabel()
            label.frame = CGRect.init(x: 16, y: 5, width: headerView.frame.width - 10, height: headerView.frame.height - 10)
            label.text = "Buy, sell and hold crypto"
            label.font = .systemFont(ofSize: 16, weight: .bold)
            label.textColor = Color.textLabelColor
            
            headerView.addSubview(label)
            
            return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 30
    }
    
    func setupRefreshControl() {
        refreshControl.addTarget(self, action: #selector(refreshContent), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
}

// MARK: - Action

extension CryptoTableViewController {
    
    @objc func refreshContent() {
        
        let group = DispatchGroup()
        
        group.enter()
        WebServices().load(resource: Crypto.getAll) { [weak self] result in
            switch result {
            case .success(let models):
                self?.cryptoListViewModel.cryptoViewModel = models.data.coins.map(CryptoViewModel.init)
                self?.tableView.reloadData()
                print(models)
            case .failure(let error):
                print(error)
            }
            group.leave()
        }
        
        group.notify(queue: .main) {
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
}
