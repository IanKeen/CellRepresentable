//
//  IntCell.swift
//  CellRepresentable
//
//  Created by Ian Keen on 8/04/2016.
//  Copyright © 2016 Mustard. All rights reserved.
//

import UIKit

class IntCell: UITableViewCell {
    //MARK: - IBOutlets
    @IBOutlet private var valueLabel: UILabel!
    
    //MARK: - Public
    func setup(viewModel: IntCellViewModel) {
        self.valueLabel.text = viewModel.displayValue
    }
}
