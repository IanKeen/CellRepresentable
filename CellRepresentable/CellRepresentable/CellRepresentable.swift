//
//  CellRepresentable.swift
//  CellRepresentable
//
//  Created by Ian Keen on 8/04/2016.
//  Copyright © 2016 Mustard. All rights reserved.
//

import UIKit

protocol CellRepresentable {
    static func registerCell(tableView: UITableView)
    func cellInstance(in tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell
    func cellSelected()
}
