//
//  MyProfileViewController.swift
//  leroymerlinwtf
//
//  Created by Admin on 27.05.2023.
//

import UIKit

class MyProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHeaderView()
        view.addSubview(headerView)
    }
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .black
        label.clipsToBounds = true
        label.text = "Мой профиль"
        label.font = UIFont.systemFont(ofSize: 35.0)
        return label
    }()
    
    private let headerSublabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.lineBreakMode = .byWordWrapping
        //label.clipsToBounds = true
        label.numberOfLines = 0
        label.text = "Войдите для синхронизации ваших заказов и покупок на всех устройствах"
        return label
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.tintColor = .white
        button.backgroundColor = .systemGreen
        button.setTitle("Войти", for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.tintColor = .green
        return button
    }()
    
    private let headerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private func configureHeaderView() {
        headerView.addSubview(headerLabel)
        headerView.addSubview(headerSublabel)
        headerView.addSubview(loginButton)
        headerView.addSubview(registerButton)
        headerView.backgroundColor = .orange
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        var size = headerLabel.sizeThatFits(headerLabel.frame.size)
        headerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 300)
        headerLabel.frame = CGRect(x: 20, y: 50, width: size.width, height: 40)
        size = headerSublabel.sizeThatFits(headerLabel.frame.size)
        headerSublabel.frame = CGRect(x: 20, y: 30 + headerLabel.frame.height + 30, width: view.frame.width - 40, height: 100)
        loginButton.frame = CGRect(x: 20, y: 30 + headerLabel.frame.height + 100, width: view.frame.width - 40, height: 60)
    }
    
}
