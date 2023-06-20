//
//  MyListViewController.swift
//  leroymerlinwtf
//
//  Created by Admin on 20.04.2023.
//

import UIKit



class MyListViewController: UIViewController {

    public var favoriteItems: [ItemModel] = []
    
   
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(RecommendedTableViewCell.self, forCellReuseIdentifier: RecommendedTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        /*
        UserDefaultsManager.shared.defaults.set(model!.itemName, forKey: "favorite name")
        UserDefaultsManager.shared.defaults.set(model!.itemPrice, forKey: "favorite price")
        UserDefaultsManager.shared.defaults.set(model!.isFavorite, forKey: "favorite bool")
         */
        if let name = UserDefaultsManager.shared.defaults.value(forKey: "favorite name"), let price = UserDefaultsManager.shared.defaults.value(forKey: "favorite price"), let bool =  UserDefaultsManager.shared.defaults.value(forKey: "favorite bool") {
            print(name)
            print(price)
            print(bool)
        }

       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let vc = EmptyListViewController()
        vc.modalPresentationStyle = .currentContext
        present(vc, animated: true, completion: nil)
        //print(favoriteItems)
        /*
            if favoriteItems.isEmpty {
                
                let vc = EmptyListViewController()
                vc.modalPresentationStyle = .currentContext
                present(vc, animated: true, completion: nil)
            } else {
                tableView.reloadData()
            }
        */
        
          
        }
       
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

extension MyListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return favoriteItems.count
        
            
     
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecommendedTableViewCell.identifier, for: indexPath) as! RecommendedTableViewCell
        
        
            cell.model = favoriteItems[indexPath.row]
        
            
            cell.configure(image: UIImage(named: "default")!)
        
        return cell
       
    }
    
    
}
