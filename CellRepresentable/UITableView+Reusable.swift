//
//  UITableView+Reusable.swift
//  CellRepresentable
//
//  Created by Elijah Semyonov on 17/03/2018.
//  Copyright © 2018 Mustard. All rights reserved.
//

import UIKit

//MARK: - Reusable

// implement Reusable protocol on UITableViewCell subclasses to allow simple dequeued cell type deduction
// override default `nibName` implementation to be a relevant nib file name or `nil` if it's code-only class

protocol Reusable {
    static var reuseIdentifier: String { get }
    static var nibName: String? { get }
}

extension Reusable {
    static var nibName: String? {
        return reuseIdentifier
    }
}

extension UITableView {
    func register<T: UITableViewCell>(_ cellClass: T.Type) where T: Reusable {
        let reusableType = cellClass as Reusable.Type
        if let nibName = reusableType.nibName {
            register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: reusableType.reuseIdentifier)
        } else {
            register(cellClass, forCellReuseIdentifier: reusableType.reuseIdentifier)
        }
    }
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: Reusable {
        let reuseIdentifier = (T.self as Reusable.Type).reuseIdentifier
        if let cell = dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? T {
            return cell
        } else {
            fatalError("\(#file) \(#function) \(#line) cell dequeued with reuseIdentifier \"\(reuseIdentifier)\" didn't match expected cell type \"\(T.self)\"")
        }
    }
}
