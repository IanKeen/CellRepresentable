//
//  IntViewController.swift
//  CellRepresentable
//
//  Created by Ian Keen on 10/04/2016.
//  Copyright © 2016 Mustard. All rights reserved.
//

import UIKit

class IntViewController: UIViewController {
    //MARK: - Private
    private var viewModel: IntViewModel!
    
    //MARK: - IBOutlet
    @IBOutlet private var label: UILabel!
    
    //MARK: - Lifecycle
    convenience init(viewModel: IntViewModel) {
        self.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Number"
        self.label.text = self.viewModel.displayValue
    }
}
