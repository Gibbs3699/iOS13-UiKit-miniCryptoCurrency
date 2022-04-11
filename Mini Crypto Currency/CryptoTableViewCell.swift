//
//  CryptoTableViewCell.swift
//  Mini Crypto Currency
//
//  Created by TheGIZzz on 10/4/2565 BE.
//

import UIKit
import SDWebImage

struct CryptoTableViewCellViewModel {
    let name: String
    let symbol: String
    let price: String
    let change: String
    let iconUrl: String
}

class CryptoTableViewCell: UITableViewCell {
    
    let cryptoStackView = UIStackView()
    
    static let identifier = "CryptoTableViewCell"

    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.cryptoCellColor
        view.layer.cornerRadius = 8.0
        view.layer.masksToBounds = false
        view.layer.shadowRadius = 4.0
        view.layer.shadowOpacity = 0.1
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = Color.nameLabelColor
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let symbolLabel: UILabel = {
        let label = UILabel()
        label.textColor = Color.symbolLabelColor
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .green
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    private let changeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    private let iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupView() {
        self.selectionStyle = .none
//        contentView.addSubview(symbolLabel)
//        contentView.addSubview(priceLabel)
//        contentView.addSubview(changeLabel)
        
        // cellView
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        // imageView
        iconView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        iconView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        iconView.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
        iconView.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20).isActive = true
        
        // nameLabel
//        nameLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        nameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
//        nameLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 2).isActive = true
        
        contentView.addSubview(cellView)
//        contentView.addSubview(nameLabel)
        contentView.addSubview(iconView)
//        // symbolLabel
//        NSLayoutConstraint.activate([
//            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
//            cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
//            cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
//            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
//        ])
//
//        // priceLabel
//        NSLayoutConstraint.activate([
//            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
//            cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
//            cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
//            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
//        ])
//
//        // changeLabel
//        NSLayoutConstraint.activate([
//            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
//            cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
//            cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
//            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
//        ])
        
//        cellView.sizeToFit()
//        nameLabel.sizeToFit()
//        symbolLabel.sizeToFit()
//        priceLabel.sizeToFit()
//        changeLabel.sizeToFit()
//
//
//        nameLabel.frame = CGRect(x: 15, y: 0, width: contentView.frame.size.width/2, height: contentView.frame.size.height/2)
//        symbolLabel.frame = CGRect(x: 15, y: contentView.frame.size.height/2 , width: contentView.frame.size.width/2, height: contentView.frame.size.height/2)
//        priceLabel.frame = CGRect(x: contentView.frame.size.width/2, y: 0, width: (contentView.frame.size.width/2)-15, height: contentView.frame.size.height)
//        priceLabel.frame = CGRect(x: contentView.frame.size.width/2, y: 0, width: (contentView.frame.size.width/2)-15, height: contentView.frame.size.height/2)
    }
    
    func configure(with viewModel: CryptoTableViewCellViewModel) {
        nameLabel.text = viewModel.name
        priceLabel.text = viewModel.price
        symbolLabel.text = viewModel.symbol
        changeLabel.text = viewModel.change
        iconView.image.sd_setImage(with: URL(string: viewModel.iconUrl))
    }
}
