//
//  RecommendedTableViewCell.swift
//  leroymerlinwtf
//
//  Created by Admin on 19.04.2023.
//

import UIKit

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    let defaults = UserDefaults()
}

struct ItemModel {
    var itemName: String
    var itemPrice: String
    var isFavorite: Bool
}
protocol FavoriteCellDelegate: UIViewController {
    func didAddToFavorite(cell: RecommendedTableViewCell)
    
}


class RecommendedTableViewCell: UITableViewCell {
    
   
    public var model: ItemModel?
    
    var delegate: FavoriteCellDelegate?
     
    static let identifier = "recommendedCell"
    private var buttonFlag: Bool = false
    private let itemLabel: UILabel = {
       let label =  UILabel()
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
   
    
    private let addFavoriteButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        
        button.tintColor = UIColor(red: 140/255.0, green: 240/255.0, blue: 120/255.0, alpha: 1)
        return button
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        
        return label
        
    }()
    public var itemImage = UIImageView()
    private let button: UIButton  = {
       let button = UIButton()
        button.backgroundColor = .secondarySystemBackground
        button.setTitleColor(.black, for: .normal)
        button.setTitle("В корзину", for: .normal)
        button.titleLabel?.minimumScaleFactor = 0.5
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        return button
    }()
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        clipsToBounds = true
        contentView.addSubview(itemLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(itemImage)
        contentView.addSubview(button)
        contentView.addSubview(addFavoriteButton)
        addFavoriteButton.addTarget(self, action: #selector(didTapAddFavoriteButton), for: .touchUpInside)
        
        selectionStyle = .none
        addFavoriteButton.tintColor = .systemGreen
        
        
    }
    
    @objc func didTapAddFavoriteButton() {
        
        
      
        delegate?.didAddToFavorite(cell: self)
        
        if let fav = self.model?.isFavorite {
            UserDefaultsManager.shared.defaults.set(model!.itemName, forKey: "favorite name")
            UserDefaultsManager.shared.defaults.set(model!.itemPrice, forKey: "favorite price")
            UserDefaultsManager.shared.defaults.set(model!.isFavorite, forKey: "favorite bool")
            addFavoriteButton.setImage(fav ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart") , for: .normal)
        }
    
}
    func addToFavorites() {
        if buttonFlag {
            
        }
    }
    
    public func configure(image: UIImage) {
        itemLabel.text = model?.itemName
        priceLabel.text = model?.itemPrice
        itemImage.image = image
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        itemLabel.frame = CGRect(x: contentView.frame.height - 20, y: 0, width: contentView.frame.width / 1.5 , height: contentView.frame.height/4)
        priceLabel.frame = CGRect(x: contentView.frame.height - 20, y: 40, width: contentView.frame.width / 1.5, height: contentView.frame.height/4)
        button.frame = CGRect(x: contentView.frame.height - 20, y: contentView.frame.height - 65, width: 100, height: 50)
        itemImage.frame = CGRect(x: 10, y: 10, width: contentView.frame.height - 40, height: contentView.frame.height - 40)
        addFavoriteButton.frame = CGRect(x: contentView.frame.width - 30, y: contentView.frame.height - 35 , width: 30, height: 30)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        model?.isFavorite = false
    }

}
