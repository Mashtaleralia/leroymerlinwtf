//
//  ItemDescriptionViewController.swift
//  leroymerlinwtf
//
//  Created by Admin on 28.04.2023.
//

import UIKit

class ItemDescriptionViewController: UIViewController {
    
    private var model: ItemModel
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private let itemImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let itemLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.isHighlighted = true
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 1
        
        return label
    }()
    let toCartButton: UIButton = {
        let button = UIButton()
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.backgroundColor = .green
        button.setTitle("В корзину", for: .normal)
        return button
    }()
    
    let subPriceLabel: UILabel = {
        let label = UILabel()
      //  label.lineBreakMode = .byWordWrapping
        //label.numberOfLines = 1
        //label.sizeToFit()
        label.tintColor = .secondaryLabel
        label.font = UIFont(name: "system", size: 10)
        return label
    }()
    
    private let footerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
     
        return view
    }()
    
    private func configureFooterView() {
        priceLabel.text = model.itemPrice
        subPriceLabel.text = "16,47 руб./кг"
        footerView.addSubview(toCartButton)
        footerView.addSubview(priceLabel)
        footerView.addSubview(subPriceLabel)
    }
    
    
     init(model: ItemModel) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(model)
        /*
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 30, width: view.frame.width, height: 44))
        
        let navItem = UINavigationItem()
        let shareItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: nil, action: nil)
        navItem.rightBarButtonItem = shareItem
        navBar.setItems([navItem], animated: false)
        view.addSubview(navBar)
         */
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        view.addSubview(footerView)
        configureFooterView()
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.tintColor = .green
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(popToItemsList))
        
    }
    @objc private func popToItemsList() {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        
        itemImageView.frame = CGRect(x: 0, y: 0, width: view.frame.height / 2.5, height: view.frame.height / 2.5)
        footerView.frame = CGRect(x: 0, y: view.frame.height - 170, width: view.frame.width, height: 100)
        priceLabel.frame = CGRect(x: 10, y: 15, width: footerView.frame.width / 5, height: 20)
       // subPriceLabel.frame = CGRect(x: 10, y: 15 + priceLabel.frame.height + 5, width: footerView.frame.width / 4, height: 20)
        let size = CGSize(width: footerView.frame.width, height: footerView.frame.height)
        subPriceLabel.frame = CGRect(x: 10, y: 15 + priceLabel.frame.height + 5, width: subPriceLabel.sizeThatFits(size).width, height: subPriceLabel.sizeThatFits(size).height)
        let buttonWidth = view.frame.width / 2.5
        toCartButton.frame = CGRect(x: view.frame.width - buttonWidth - 20, y: 15, width: buttonWidth, height: footerView.frame.height - 30)
        
    }
}

extension ItemDescriptionViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return view.frame.height / 2.5
        }
        return 80
    }
   
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            var content = cell.defaultContentConfiguration()
        if indexPath.row == 0 {
           
        }
        else if indexPath.row == 1 {
            content.text = model.itemName
            content.secondaryText = "316 отзывов"
        }

            
        cell.contentConfiguration = content
        
        return cell
    }
}



