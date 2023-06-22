//
//  ViewController.swift
//  leroymerlinwtf
//
//  Created by Admin on 19.04.2023.
//

import UIKit



class ViewController: UIViewController {
    
    var favoriteItems: [ItemModel] = []

    
    private let items = [ItemModel(itemName: "Гипсокартон влагостойкий 12.5 mm Knauf 2500x1200 mm 3", itemPrice: "467руб.", isFavorite: true, state: .notInCart), ItemModel(itemName: "Штукатурка гипсовая Knauf Ротбанд 30 кг", itemPrice: "491руб.", isFavorite: false, state: .notInCart), ItemModel(itemName: "Грунтовка глубокого проникновения Ceresit CT17 10 л", itemPrice: "1100руб.", isFavorite: false, state: .notInCart), ItemModel(itemName: "Набор садовой мебели складной Fira Celebration сталь/дерево", itemPrice: "4990руб.", isFavorite: false, state: .notInCart), ItemModel(itemName: "Гамак кресло с бахромой 82х31 хлопок", itemPrice: "1990руб.", isFavorite: false, state: .notInCart), ItemModel(itemName: "Кресло-гамак садовый 82х131 см, поликоттон/сталь", itemPrice: "4990руб.", isFavorite: false, state: .notInCart), ItemModel(itemName: "Гамак кресло с бахромой 82х31 хлопок", itemPrice: "1990руб.", isFavorite: false, state: .notInCart), ItemModel(itemName: "Кресло-гамак садовый 82х131 см, поликоттон/сталь", itemPrice: "4990руб.", isFavorite: false, state: .notInCart), ItemModel(itemName: "Набор садовой мебели складной Fira Celebration сталь/дерево", itemPrice: "4990руб.", isFavorite: false, state: .notInCart)]
    
    private var catalogSections = [CatalogModel(categoryName: "Каталог", image: UIImage(named: "catalog-pic")!), CatalogModel(categoryName: "Инструменты", image: UIImage(named: "catalog-pic")!), CatalogModel(categoryName: "Краски", image: UIImage(named: "catalog-pic")!), CatalogModel(categoryName: "Сад", image: UIImage(named: "catalog-pic")!), CatalogModel(categoryName: "Декор", image: UIImage(named: "catalog-pic")!), CatalogModel(categoryName: "Напольные покрытия", image: UIImage(named: "catalog-pic")!)]
    
    var filteredData = [ItemModel]()
    
    var isSearching: Bool = false
    
    private var collectionView: UICollectionView?
  /*
    func didAddToFavorite(cell: RecommendedTableViewCell) {
        
        let indexPath = tableView.indexPath(for: cell)
        var state = cell.model?.isFavorite
        cell.model?.isFavorite = !state!
        if !state! {
            favoriteItems.append(cell.model!)
         
            //favoriteItems.remove(at: indexPath!.row)
        }
        //print(indexPath!.row)
        //print(favoriteItems)
    }
   */

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        //tableView.autoresizingMask = UIView.AutoresizingMask.flexibleHeight
        
        
            
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableHeaderView = headerView
        view.addSubview(headerView)
        configureHeader()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 15
        layout.minimumInteritemSpacing = 15
        let size = (view.frame.width - 30) / 3
        layout.itemSize = CGSize(width: size, height: size)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.register(CatalogCollectionViewCell.self, forCellWithReuseIdentifier: CatalogCollectionViewCell.identifier)
        collectionView?.backgroundColor = .white
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        guard let collectionView = collectionView else {
            return
        }
        tableView.estimatedRowHeight = view.frame.height / 5
        tableView.rowHeight = UITableView.automaticDimension
    
        
        // Do any additional setup after loading the view.
    }
    let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 140/255.0, green: 240/255.0, blue: 120/255.0, alpha: 1)
        view.clipsToBounds = true
        return view
        
    }()
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
       
        searchBar.backgroundColor = .white
        searchBar.placeholder = "Поиск"
        return searchBar
    }()
    func configureHeader() {
        
        
        headerView.addSubview(searchBar)
        searchBar.frame = CGRect(x: 25, y: view.bounds.height / 8, width: view.frame.width-50, height: 70)
    }
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(RecommendedTableViewCell.self, forCellReuseIdentifier: RecommendedTableViewCell.identifier)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds //CGRect(x: 0, y: view.frame.height / 4, width: view.bounds.width, height: view.bounds.height)
        headerView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height / 4)
        collectionView?.frame = CGRect(x: 0, y: 0, width: headerView.frame.width, height: headerView.frame.height / 2)
       
    }

}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if isSearching {
            return 2
        }
        return 4
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if !isSearching {
            if section == 1 {
                return "Рекомендуем"
            } else if section == 2 {
                return "Товары для уборки"
            } else if section == 3 {
                return "Садовая мебель"
            }
        }
      
        return nil
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return filteredData.count
        }
        if section == 0 {
            return 1
        }
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        if indexPath.section == 0 && indexPath.row == 0 {
            if let collectionView = collectionView {
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                cell.addSubview(collectionView)
                return cell
            }
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: RecommendedTableViewCell.identifier, for: indexPath) as! RecommendedTableViewCell
        if isSearching {
            
           
            cell.model = filteredData[indexPath.row]
        } else {
          
            if indexPath.section == 1 {
                cell.model = items[indexPath.row + indexPath.section - 1]
            } else {
                cell.model = items[indexPath.row + indexPath.section + 1]
            }
      
            
          
        
            
        }
      
        
        
        cell.delegate = self
       
        cell.configure(image: UIImage(named: "default")!)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height / 5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var model: ItemModel
        if isSearching {
            
           
            model = filteredData[indexPath.row]
        } else {
          
            if indexPath.section == 1 {
                model = items[indexPath.row + indexPath.section - 1]
            } else {
                model = items[indexPath.row + indexPath.section + 1]
            }
   
        }
        
        
        let vc = ItemDescriptionViewController(model: model)
        
        self.navigationController?.pushViewController(vc, animated: true)
         
       
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatalogCollectionViewCell.identifier, for: indexPath) as! CatalogCollectionViewCell
        cell.backgroundColor = .secondarySystemBackground
        cell.configure(with: catalogSections[indexPath.row])
        return cell
    }
    /*
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        <#code#>
    }
     */
}


extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange text: String) {
        isSearching = true
        self.filteredData.removeAll()
        guard text != "" || text != " " else {
            print("empty search")
            return
        }
        for item in items {
            let searchText = text.lowercased()
            let isArrayContain = item.itemName.lowercased().range(of: searchText)
            if isArrayContain != nil {
                filteredData.append(item)
            }
        }
        print(filteredData)
        if searchBar.text == "" {
            isSearching = false
            tableView.reloadData()
        } else {
            isSearching = true
            tableView.reloadData()
        }
    }
}


extension ViewController: DidTapAddToCartDelegate {
    
    
    
    
    
    func addToCart(_ item: inout ItemModel) {
        print("cum")
        switch item.state {
        case .inCart:
            item.state = .notInCart
            
        
        case .notInCart:
            item.state = .inCart
            
        }
    }
}

