//
//  HomeViewModel.swift
//  CellRepresentable
//
//  Created by Ian Keen on 8/04/2016.
//  Copyright © 2016 Mustard. All rights reserved.
//

import Foundation

class HomeViewModel {
    //MARK: - Outputs
    let tableItemTypes: [CellRepresentable.Type] = [StringCellViewModel.self, IntCellViewModel.self]
    private(set) var tableItems = [CellRepresentable]()
    
    //MARK: - Events
    var didUpdate: (() -> Void)?
    var didSelectInteger: ((Int) -> Void)?
    var didSelectString: ((String) -> Void)?
    
    //MARK: - Inputs
    func refreshData() {
        self.tableItems = self.randomTableItems()
        self.didUpdate?()
    }
}

//MARK: - Mock Data Generation
extension HomeViewModel {
    func randomTableItems() -> [CellRepresentable] {
        return (1...30).map { value in
            let rand = random(min: 0, max: 1)
            
            if (rand == 0) {
                return self.stringCellViewModel(value: value)
            } else {
                return self.intCellViewModel(value: value)
            }
        }
    }
    
    private func stringCellViewModel(value: Int) -> StringCellViewModel {
        let instance = StringCellViewModel(value: value)
        instance.didSelectString = { self.didSelectString?($0) }
        return instance
    }
    private func intCellViewModel(value: Int) -> IntCellViewModel {
        let instance = IntCellViewModel(value: value)
        instance.didSelectInteger = { self.didSelectInteger?($0) }
        return instance
    }
}
