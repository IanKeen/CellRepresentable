//
//  HomeViewController.swift
//  CellRepresentable
//
//  Created by Ian Keen on 8/04/2016.
//  Copyright © 2016 Mustard. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet private var tableView: UITableView!
    
    //MARK: - Private Properties
    private var viewModel: HomeViewModel!
    
    //MARK: - Lifecycle
    convenience init(viewModel: HomeViewModel) {
        self.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        self.tableView.estimatedRowHeight = 50
        
        self.addRefreshButton()
        
        self.viewModel.tableItemTypes.forEach { $0.registerCell(tableView: self.tableView) }
        self.viewModel.didUpdate = self.refreshUI
        self.viewModel.refreshData()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.indexPathsForSelectedRows?
            .forEach { self.tableView.deselectRow(at: $0, animated: true) }
    }
    
    //MARK: - Private
    private func addRefreshButton() {
        let refresh = UIBarButtonItem(title: "Refresh", style: .plain, target: self, action: #selector(HomeViewController.refreshButtonTouchUpInside))
        self.navigationItem.leftBarButtonItem = refresh
    }
    private func refreshUI() {
        self.tableView.reloadData()
    }
    
    //MARK: - Actions
    @IBAction private func refreshButtonTouchUpInside() {
        self.viewModel.refreshData()
    }
}

//MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.tableItems.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = self.viewModel.tableItems[indexPath.row]
        return cellViewModel.cellInstance(in: tableView, for: indexPath)
    }
}

//MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellViewModel = self.viewModel.tableItems[indexPath.row]
        cellViewModel.cellSelected()
    }
}
