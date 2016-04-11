//
//  StringCellViewModel.swift
//  CellRepresentable
//
//  Created by Ian Keen on 8/04/2016.
//  Copyright © 2016 Mustard. All rights reserved.
//

import UIKit

class StringCellViewModel {
    //MARK: - Private
    private let rawValue: Int
    
    //MARK: - Outputs
    let displayValue: String
    
    //MARK: - Events
    var didSelectString: ((String) -> Void)?
    
    //MARK: - Lifecycle
    init(value: Int) {
        self.rawValue = value
        self.displayValue = value.asWords ?? "Unknown"
    }
}

//MARK: - CellRepresentable
extension StringCellViewModel: CellRepresentable {
    static func registerCell(tableView: UITableView) {
        tableView.registerNib(UINib(nibName: String(StringCell), bundle: nil), forCellReuseIdentifier: String(StringCell))
    }
    func cellInstance(tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(String(StringCell), forIndexPath: indexPath) as! StringCell
        let viewModel = StringCellViewModel(value: self.rawValue)
        cell.setup(viewModel)
        return cell
    }
    func cellSelected() {
        self.didSelectString?("\(self.rawValue)")
    }
}
