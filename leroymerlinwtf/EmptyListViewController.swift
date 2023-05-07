//
//  EmptyListViewController.swift
//  leroymerlinwtf
//
//  Created by Admin on 20.04.2023.
//

import UIKit
import SafariServices

class EmptyListViewController: UIViewController {
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 35.0)
        label.text = "В списке покупок ничего нет"
        return label
    }()
    
    private let subLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .secondaryLabel
        label.text = "Войдите в профиль, если вы уже добавляли товары под своим именем"
        
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = .secondarySystemBackground
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 6.0
        
        return button
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        headerLabel.frame = CGRect(x: 15, y: view.frame.height / 8, width: view.frame.width * 0.75, height: view.frame.height / 10)
        subLabel.frame = CGRect(x: 15, y: view.frame.height / 8 + headerLabel.frame.height + 5, width: view.frame.width - 30, height: view.frame.height / 10)
        button.frame = CGRect(x: 15, y: view.frame.height / 8 + headerLabel.frame.height + subLabel.frame.height + 20, width: view.frame.width - 30, height: 50)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(headerLabel)
        view.addSubview(subLabel)
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapRegistrationButton), for: .touchUpInside)
    }
    
    @objc func didTapRegistrationButton() {
        if let url = URL(string: "https://auth.leroymerlin.ru/login?clientId=H0BmGuQ72JKTzins1qIX&callbackUri=https://leroymerlin.ru/oauthCallback&state=https://leroymerlin.ru/lk/info") {
            let vc = SFSafariViewController(url: url)
            present(vc, animated: true, completion: nil)
        }
   
    }
}
