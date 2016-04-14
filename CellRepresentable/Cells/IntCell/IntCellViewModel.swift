//
//  IntCellViewModel.swift
//  CellRepresentable
//
//  Created by Ian Keen on 8/04/2016.
//  Copyright © 2016 Mustard. All rights reserved.
//

import UIKit

class IntCellViewModel {
    //MARK: - Private
    private let rawValue: Int
    
    //MARK: - Outputs
    let displayValue: String
    
    //MARK: - Events
    var didSelectInteger: ((Int) -> Void)?
    
    //MARK: - Lifecycle
    init(value: Int) {
        self.rawValue = value
        self.displayValue = "\(value)"
    }
}

//MARK: - CellRepresentable
extension IntCellViewModel: CellRepresentable {
    static func registerCell(tableView: UITableView) {
        tableView.registerNib(UINib(nibName: String(IntCell), bundle: nil), forCellReuseIdentifier: String(IntCell))
    }
    func cellInstance(tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(String(IntCell), forIndexPath: indexPath) as! IntCell
        cell.setup(self)
        return cell
    }
    func cellSelected() {
        self.didSelectInteger?(self.rawValue)
    }
}
