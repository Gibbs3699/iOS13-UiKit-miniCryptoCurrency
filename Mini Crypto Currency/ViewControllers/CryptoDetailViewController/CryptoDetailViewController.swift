//
//  CryptoDetailViewController.swift
//  Mini Crypto Currency
//
//  Created by TheGIZzz on 11/4/2565 BE.
//

import Foundation
import UIKit

struct CryptosDetailViewModel {
    let name: String
    let symbol: String
    let description: String
    let color: String
    let iconUrl: String
    let price: String
    let marketCap: String
}

class CryptoDetailViewController: UIViewController {
    
    private var cryptoDetailListViewModel = CryptoDetailListViewModel()
    
    var coinUUID = CryptoTableViewController.coinUUID
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var symbolLabel: UILabel = {
        let label = UILabel()
        label.textColor = Color.symbolLabelColor
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .green
//        label.textAlignment = .right
        label.textColor = Color.textLabelColor
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var priceValueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .green
//        label.textAlignment = .right
        label.textColor = Color.textLabelColor
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var marketCAPLabel: UILabel = {
        let label = UILabel()
        label.textColor = .green
//        label.textAlignment = .right
        label.textColor = Color.textLabelColor
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var marketCAPValueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .green
//        label.textAlignment = .right
        label.textColor = Color.textLabelColor
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var detailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .green
//        label.textAlignment = .right
        label.textColor = Color.textLabelColor
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var websiteButton: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        configureDatail()
        
//        WebServices().load(resource: CryptoDetail.getDetail(uuid: coinUUID)) { [weak self] result in
//            switch result {
//            case .success(let models):
////                self?.cryptoDetailListViewModel.cryptoDetailViewModel = models?.data.coin.map(CryptoDetailViewModel.init)
////                print("datail --->  \(models)")
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
    
    func setupView() {
        view.addSubview(iconView)
        
        // cellView
        NSLayoutConstraint.activate([
            // imageView
            iconView.heightAnchor.constraint(equalToConstant: 50),
            iconView.widthAnchor.constraint(equalToConstant: 50),
            iconView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            iconView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            
        ])
        

    }
    
    func configureDatail() {
//        let viewModel = cryptoDetailListViewModel
//        nameLabel.text = viewModel.name
//        priceLabel.text = viewModel.price

//        DispatchQueue.main.async {
//            self.iconView.sd_setImage(with: URL(string: viewModel.iconUrl), completed: nil)
//        }
    }
}
