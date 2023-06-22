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
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        configureHeaderView()
        configureData()
        
        //view.addSubview(headerView)
    }
    
    var data = [[MyProfileCellModel]]()
    
    private func configureData() {
        data.append([MyProfileCellModel(title: "Мой регион") { [weak self] in
            self?.didTapMyRegion()
        }])
        data.append([MyProfileCellModel(title: "Получатели") { [weak self] in
            self?.didTapReceivers()
        }, MyProfileCellModel(title: "Адреса доставки") { [weak self] in
            self?.didTapDelivery()
        }])
        
        data.append([MyProfileCellModel(title: "Доставка и самовывоз") { [weak self] in
            self?.didTapDelivery()
        }, MyProfileCellModel(title: "Правила продажи") { [weak self] in
            self?.didTapTermsAndPolicy()
        }, MyProfileCellModel(title: "Клиентская поддержка") { [weak self] in
            self?.didTapSupport()
        }])
       
      
    }
    
    private func didTapMyRegion() {
        
    }
    private func didTapReceivers() {
        
    }
    private func didTapDelivery() {
        
    }
    private func didTapTermsAndPolicy() {
        
    }
    private func didTapSupport() {
        
    }
    
    
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
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
        //headerView.backgroundColor = .orange
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        var size = headerLabel.sizeThatFits(headerLabel.frame.size)
        headerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 300)
        headerLabel.frame = CGRect(x: 20, y: 50, width: size.width, height: 40)
        size = headerSublabel.sizeThatFits(headerLabel.frame.size)
        headerSublabel.frame = CGRect(x: 20, y: 30 + headerLabel.frame.height + 30, width: view.frame.width - 40, height: 100)
        loginButton.frame = CGRect(x: 20, y: headerSublabel.frame.maxY + 10, width: view.frame.width - 40, height: 60)
    }
    
}

struct MyProfileCellModel {
    var title: String
    var handler: () -> Void
}


extension MyProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if indexPath.section == 0 && indexPath.row == 0 {
            cell.addSubview(headerView)
            cell.selectionStyle = .none
        } else {
            cell.textLabel?.text = data[indexPath.section - 1][indexPath.row].title
            cell.accessoryType = .disclosureIndicator
         //   if indexPath.section == 1 && indexPath.row == 1 {
            cell.detailTextLabel?.text = "Москва и область"
          //  }
            
        }
        
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 1
        } else if section == 2 {
            return 2
        } else {
            return 3
        }
        //return 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 2 {
            return "Личные данные"
        } else if section == 3 {
            return "Помощь"
        }
        return nil
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0 {
            return headerView.frame.height
        }
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*
        if indexPath.row == 0 {
            
            tableView.deselectRow(at: indexPath, animated: false)
        } */
        
    }
    
}
