//
//  CatalogCollectionViewCell.swift
//  leroymerlinwtf
//
//  Created by Admin on 20.04.2023.
//

import UIKit

struct CatalogModel {
    var categoryName: String
    var image: UIImage
}

class CatalogCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CatalogCollectionViewCell"
    
    private let sectionNameLabel: UILabel = {
       let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
   
    private let sectionImageView = UIImageView()
    
    required init?(coder: NSCoder) {
        fatalError("error")
    }
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(sectionNameLabel)
        contentView.addSubview(sectionImageView)
       
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        sectionNameLabel.frame = CGRect(x: contentView.frame.width / 8, y: contentView.frame.height / 6, width: contentView.frame.width - 10, height: 20)
        sectionImageView.frame = CGRect(x: contentView.frame.height - 60, y: contentView.frame.height - 60, width: 60, height: 60)
        
        
    }
    public func configure(with model: CatalogModel) {
        sectionNameLabel.text = model.categoryName
        sectionImageView.image = model.image
    }
}
