//
//  CryptoTableViewCell.swift
//  Mini Crypto Currency
//
//  Created by TheGIZzz on 10/4/2565 BE.
//

import UIKit

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

    var cellView: UIView = {
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
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = Color.textLabelColor
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var symbolLabel: UILabel = {
        let label = UILabel()
        label.textColor = Color.symbolLabelColor
        label.font = .systemFont(ofSize: 14, weight: .bold)
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
    
    var changeLabel: UILabel = {
        let label = UILabel()
//        label.textAlignment = .right
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var arrowIconView: UIImageView = {
        let image = UIImage(systemName: "arrow.up")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let changeLabelStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 0
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupView() {
        contentView.addSubview(cellView)
        contentView.addSubview(iconView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(symbolLabel)
        contentView.addSubview(priceLabel)
        changeLabelStack.addArrangedSubview(arrowIconView)
        changeLabelStack.addArrangedSubview(changeLabel)
        contentView.addSubview(changeLabelStack)
        self.selectionStyle = .none
        
        // cellView
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            // imageView
            iconView.heightAnchor.constraint(equalToConstant: 40),
            iconView.widthAnchor.constraint(equalToConstant: 40),
            iconView.centerYAnchor.constraint(equalTo: cellView.centerYAnchor),
            iconView.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20),
            
            // nameLabel
            nameLabel.topAnchor.constraint(equalTo: iconView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            // symbolLabel
            symbolLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 6),
            symbolLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 16),
            symbolLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            // priceLabel
            priceLabel.topAnchor.constraint(equalTo: iconView.topAnchor, constant: 6),
            priceLabel.rightAnchor.constraint(equalTo: cellView.rightAnchor, constant: -20),

            arrowIconView.heightAnchor.constraint(equalToConstant: 12),
            arrowIconView.widthAnchor.constraint(equalToConstant: 12),
            
            // changeLabel
            changeLabelStack.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 6),
            changeLabelStack.rightAnchor.constraint(equalTo: cellView.rightAnchor, constant: -20)
        ])
        

    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        priceLabel.text = nil
        symbolLabel.text = nil
        changeLabel.text = nil
        iconView.image = nil
    }
    
    func configure(with viewModel: CryptoTableViewCellViewModel) {
        nameLabel.text = viewModel.name
        priceLabel.text = viewModel.price
        symbolLabel.text = viewModel.symbol
        changeLabel.text = viewModel.change
        
        DispatchQueue.main.async {
            self.iconView.sd_setImage(with: URL(string: viewModel.iconUrl), completed: nil)
        }
    }
}
