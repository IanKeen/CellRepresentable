//
//  StringViewModel.swift
//  CellRepresentable
//
//  Created by Ian Keen on 10/04/2016.
//  Copyright © 2016 Mustard. All rights reserved.
//

import Foundation

class StringViewModel {
    //MARK: - Outlet
    let displayValue: String
    
    //MARK: - Lifecycle
    init(value: String) {
        self.displayValue = value
    }
}