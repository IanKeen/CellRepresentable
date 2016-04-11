//
//  NavigationCoordinator.swift
//  CellRepresentable
//
//  Created by Ian Keen on 8/04/2016.
//  Copyright © 2016 Mustard. All rights reserved.
//

import UIKit

class NavigationCoordinator {
    //MARK: - Private Properties
    private let navigationController: UINavigationController
    
    //MARK: - Lifecycle
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    //MARK: - Public
    func start() {
        self.showHome()
    }
    
    //MARK: - Private
    private func showHome(animated: Bool = false) {
        let viewModel = HomeViewModel()
        viewModel.didSelectInteger = self.showInt
        viewModel.didSelectString = self.showString
        
        let viewController = HomeViewController(viewModel: viewModel)
        self.navigationController.pushViewController(viewController, animated: animated)
    }
    private func showInt(value: Int) {
        let viewModel = IntViewModel(value: value)
        let viewController = IntViewController(viewModel: viewModel)
        self.navigationController.pushViewController(viewController, animated: true)
    }
    private func showString(value: String) {
        let viewModel = StringViewModel(value: value)
        let viewController = StringViewController(viewModel: viewModel)
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
