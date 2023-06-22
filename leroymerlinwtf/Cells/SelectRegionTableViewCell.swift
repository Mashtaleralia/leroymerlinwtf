//
//  SelectRegionTableViewCell.swift
//  leroymerlinwtf
//
//  Created by Admin on 22.06.2023.
//

import UIKit

enum RegionCellState {
    case selected
    case notSelected
}

struct SelectCellModel {
    var name: String
    var state: RegionCellState
}

class SelectRegionTableViewCell: UITableViewCell {

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }

}
