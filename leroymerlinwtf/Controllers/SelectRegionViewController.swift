//
//  SelectRegionViewController.swift
//  leroymerlinwtf
//
//  Created by Admin on 22.06.2023.
//

import UIKit

class SelectRegionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(popBack))
        
        view.addSubview(selectionView)
        configureSelectionView()
    }
    
    
    
    private let selectionView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let selectionButton: UIButton = {
        let button = UIButton()
        button.tintColor = .white
        button.backgroundColor = .green
        button.setTitle("Выбрать", for: .normal)
        button.layer.cornerRadius = 5.0
        return button
    }()
    
    private func configureSelectionView() {
        selectionView.addSubview(selectionButton)
    }
    
    @objc private func popBack() {
        navigationController?.popViewController(animated: true)
    }
    
    private var data = ["Москва, Московская область", "Санкт-Петербург", "Архангельск", "Барнаул", "Белгород", "Владивосток", "Волгоград", "Екатеринбург", "Иваново", "Иркутск", "Казань", "Кемерово", "Клин", "Краснодар", "Липецк", "Нижний Новгород", "Омск"]
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        let tabBarHeight = tabBarController?.tabBar.frame.size.height
        //view.frame.height - 70 - tabBarHeight!
        selectionView.frame = CGRect(x: 0, y: 200 , width: view.frame.width, height: 70)
        selectionButton.frame = CGRect(x: 10, y: 200, width: selectionView.frame.width - 20, height: selectionView.frame.height - 20)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        let image = UIImage(systemName: "location.circle")?.withTintColor(.black)
        cell.imageView?.image = image
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
}

